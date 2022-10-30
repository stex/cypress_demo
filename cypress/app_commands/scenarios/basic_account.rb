class BasicAccount < ::AppScenarioBase
  def scenario
    FactoryBot.create(:account, :verified)
  end
end

BasicAccount.new.generate
