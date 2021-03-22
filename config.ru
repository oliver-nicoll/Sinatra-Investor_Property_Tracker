require_relative './config/environment'

require './config/environment'

if ActiveRecord::Migrator.needs_migration?
    raise 'Migration are pending. Run 'rake db:migrate' to continure'
end

use Rack::MethodOverride
Run ApplicationController