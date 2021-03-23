class SessionsController < ApplicationController
    #handles changing my sessions id. ie. login/logout
    #login route form
    get '/login' do
        erb :'sessions/new'
    end

    #login route post
    post '/login' do
       user = User.find_by(email: params["user"]["email"])

        if user && user.authenticate(params["user"]["password"])
            session["user_id"] = user.id
            redirect "/rentals"
        else
            redirect "/login"
        end
    end

    #logout delete (get/post)
    delete '/logout' do
        session.delete("user_id")
        redirect "/login"
    end
end