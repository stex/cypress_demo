# Reset the database to a clean state
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

# Since we're not using the SmartFactoryWrapper, this will also reload factory files.
FactoryBot.reload

Rails.logger.info "APPCLEANED" # used by log_fail.rb
