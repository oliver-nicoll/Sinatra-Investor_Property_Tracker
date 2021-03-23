require "./config/environment"

use Rack::MethodOverride

# use UserController
use InvestorController
use RentalController
run ApplicationController