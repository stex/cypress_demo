# This is loaded once before the first command is executed
require Rails.root.join("cypress", "app_commands", "scenarios", "base")

begin
  require 'database_cleaner-active_record'
rescue LoadError => e
  puts e.message
  begin
    require 'database_cleaner'
  rescue LoadError => e
    puts e.message
  end
end

# require 'vcr'
# VCR.configure do |config|
#   config.hook_into :webmock
# end
