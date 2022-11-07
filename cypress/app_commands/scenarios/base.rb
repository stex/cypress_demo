require "json"

class AppScenarioBase
  FIXTURE_PATH = Rails.root.join("cypress", "fixtures")

  def generate
    scenario.yield_self do |result|
      adjust_response_json(result, json_with_gid(result))
    end
  end

  def scenario
    fail NotImplementedError
  end

  #
  # @param [#as_json] result The return value of #scenario
  # @param [Hash, Array<Hash>] json The current JSON hash
  # @return [Hash, Array<Hash>] The new JSON
  #
  def adjust_response_json(_result, json)
    json
  end

  private

  #
  # @param [#as_json, Array<#as_json>] records
  # @return [Hash, Array<Hash>] The given record(s) in their #as_json format, but extended with
  #   the identifier properties from Identifiable
  #
  def json_with_gid(records)
    if records.is_a?(Array)
      records.map { |r| r.as_json.merge(gid: r.to_global_id.to_s) }
    else
      records.as_json.merge(gid: records.to_global_id.to_s)
    end
  end

  def load_fixture(path)
    JSON.parse(File.read(FIXTURE_PATH.join(path)))
  end
end
