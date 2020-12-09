# spec/cypress/app_commands/clean.rb

# Reset the database to a clean state
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

# Reload factories, reset sequences
FactoryBot.reload

Rails.logger.info "APPCLEANED" # used by log_fail.rb
