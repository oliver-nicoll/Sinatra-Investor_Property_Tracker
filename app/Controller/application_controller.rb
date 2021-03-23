class ApplicationController < Sinatra::Base
    # set :views, Proc.new { File.join(root, "../views/") }
  
  
    configure do
      set :public_folder, 'public'
      set :views, 'app/views'
      enable :sessions
      set :session_secret, ENV['SESSION_SECRET']
    end
  
      get '/' do
        erb :search
      end

      get '/search' do 
        @rental = Rental.find_by(address: params["address"])
        erb :results
      end

      helpers do 
        def current_user
         @current_user ||= User.find_by_id(session["user_id"])
        end

        def logged_in?
          !!current_user
        end
      end
  end