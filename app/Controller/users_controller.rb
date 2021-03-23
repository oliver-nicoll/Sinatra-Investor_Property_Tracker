class UsersController < ApplicationController
    #handles the signup as well as editing or deleting a user account
    #signup route form
    get '/signup' do

    end

    #signup route post
    post '/signup' do

    end

    get '/users' do
        @users = user.all 
        erb :'user/index'
    end

    
    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        erb :'user/show'
    end

    get '/users/new' do
        erb :'user/new'
    end

    get '/users/:id/edit' do
        @user = User.find_by_id(params[:id])
        erb :'user/edit'
    end

    post '/users' do
        user = User.new(params[:user])
        
        if user.save
            redirect to "/user/#{user.id}"
        else
            #flash message
            redirect to "/user/new"
        end
    end

    put '/users/:id' do
        user = User.find_by_id(params[:id])
        user.name = params[:first_name]
        user.location = params[:location]
        
        if user.update(params[:user])
            redirect to "/user/#{user.id}"
        else
            #flash warning
            redirect to "/user/#{user.id}/edit"
        end
    end

    delete '/users/:id' do
        user = User.find_by_id(params[:id])
        user.destroy
        #flash message
        redirect to '/user'
    end
end