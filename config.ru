require "./config/environment"

use Rack::MethodOverride

use SessionsController
use UsersController
use RentalController
run ApplicationController