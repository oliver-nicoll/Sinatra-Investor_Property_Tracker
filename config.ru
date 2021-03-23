require "./config/environment"

use Rack::MethodOverride

use IncomeController
use InvestorController
use RentalController
run ApplicationController