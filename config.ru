# config.ru

require './app'
$stdout.sync = true
run Sinatra::Application

begin
  # fi_check_migration

  use Rack::MethodOverride

rescue ActiveRecord::PendingMigrationError => e
  warn e
  exit 1
end