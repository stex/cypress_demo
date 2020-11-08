# frozen_string_literal: true

class CypressFactoryBot
  attr_reader :factory_method, :model_name, :args

  delegate :logger, to: "CypressOnRails.configuration"

  def initialize(factory_method, model_name, *args)
    @factory_method = factory_method
    @model_name = model_name.to_sym
    @args = args
  end

  def generate
    logger.debug("$> FactoryBot.#{factory_method}(#{model_name}, #{args.join(", ")})")
    public_send(factory_method).yield_self do |result|
      if result.is_a?(Array)
        result.map { |r| r.as_json.merge(gid: r.to_global_id.to_s) }
      else
        result.as_json.merge(gid: result.to_global_id.to_s)
      end
    end
  rescue => e
    logger.error "#{e.class}: #{e.message}"
    logger.error e.backtrace.join("\n")
    logger.error e.record.inspect if e.is_a?(ActiveRecord::RecordInvalid)
    raise e
  end

  def create
    *traits, attributes = args
    # We don't use CypressOnRails::SmartFactoryWrapper here since it would reset our
    # factory sequences every time a factory is used, resulting in failing uniqueness validations
    FactoryBot.create(model_name, *traits.map(&:to_sym), prepare(attributes))
  end

  def create_list
    amount, *traits, attributes = args
    FactoryBot.create_list(model_name, amount, *traits.map(&:to_sym), prepare(attributes))
  end

  private

  def key_suffix
    /_identifiers?$/
  end

  def identifier_key?(key)
    key.match?(key_suffix)
  end

  def convert_key(key)
    key.split(key_suffix).first
  end

  def convert_value(value)
    value.is_a?(Array) ? value.map(&GlobalID::Locator.method(:locate)) : GlobalID::Locator.locate(value)
  end

  def prepare(attributes)
    attributes.map { |key, value|
      next [key, value] unless identifier_key?(key)
      [convert_key(key), convert_value(value)]
    }.to_h
  end
end

CypressFactoryBot.new(*command_options).generate

