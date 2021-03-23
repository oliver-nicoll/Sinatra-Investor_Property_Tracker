require "./config/environment"

use Rack::MethodOverride

use InvestorController
use RentalController
run ApplicationController