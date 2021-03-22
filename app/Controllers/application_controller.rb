class ApplicationController < Sinatra::Base
    set :views, Proc.new { File.join(root, "../views/") }
  
    # enable :sessions
    configure do
      set :public_folder, 'public'
      set :views, 'app/views'
      enable :sessions
      
    end
  
      get '/' do
        erb :index
      end
  end