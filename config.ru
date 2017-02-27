require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise "Migrations are pending. Run `rake db:migrate SINATRA_ENV=test`"
end

# use UserController
# use SpiderController
use Rack::MethodOverride
run ApplicationController
