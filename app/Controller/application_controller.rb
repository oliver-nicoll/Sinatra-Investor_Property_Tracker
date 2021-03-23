class ApplicationController < Sinatra::Base
    # set :views, Proc.new { File.join(root, "../views/") }
  
  
    configure do
      set :public_folder, 'public'
      set :views, 'app/views'
      enable :sessions
      set :session_secret, ENV['SESSION_SECRET']
    end
  
      get '/' do
        erb :index
      end

      get '/search' do 
        @rental = Rental.find_by(address: params[:address])
        erb :search
      end
  end