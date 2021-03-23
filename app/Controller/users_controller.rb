class UsersController < ApplicationController
    #handles the signup as well as editing or deleting a user account
    #signup route form
    get '/signup' do
        erb :'users/new'
    end

    #signup route post
    post '/signup' do
        user = User.new(params["user"])

        if user.save 
            session["user_id"] = user.id
            redirect to "/rentals"
        else
            redirect "/signup"
        end
    end

    get '/users' do
        @users = user.all 
        erb :'users/index'
    end

    
    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        erb :'users/show'
    end

    get '/users/new' do
        erb :'users/new'
    end
#update 1 rental
    get '/users/:id/edit' do
        @user = User.find_by_id(params[:id])
        erb :'users/edit'
    end

#create new user

    post '/users' do
        user = User.new(params[:user])
        
        if user.save
            redirect to "/users/#{user.id}"
        else
            "Error #{user.errors.full_messages.join(", ")}"
            #flash message
            sleep 5
            redirect to "/users/new"
        end
    end

    put '/users/:id' do
        user = User.find_by_id(params[:id])
        user.first_name = params[:first_name]
        user.last_name = params[:last_name]
        user.email = params[:email]
        user.age = params[:age]
        user.buildings_owned = params[:buildings_owned]

        if user.update(params[:user])
            redirect to "/users/#{user.id}"
        else
            #flash warning
            redirect to "/users/#{user.id}/edit"
        end
    end

    delete '/users/:id' do
        user = User.find_by_id(params[:id])
        user.destroy
        #flash message
        redirect to '/users'
    end
end