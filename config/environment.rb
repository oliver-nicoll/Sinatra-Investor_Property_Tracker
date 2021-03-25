require "bundler/setup"
Bundler.require
require 'dotenv/load'
require 'rack-flash'

ActiveRecord::Base.establish_connection({
    :adapter => "sqlite3",
    :database => "db/development.sqlite3"
})

require_all 'app'

ActiveRecord::Base.logger = Logger.new(STDOUT)