class BasicUser < AppScenarioBase
  def scenario
    FactoryBot.create(:user, load_fixture("basic_user.json"))
  end
end

BasicUser.new.generate
