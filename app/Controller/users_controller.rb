class UsersController < ApplicationController
    #handles the signup as well as editing or deleting a user account
    #if logged in don't show

    #signup route form
    get '/signup' do
        redirect_if_logged_in

        erb :'users/new'
    end

    #signup route post
    post '/signup' do
        redirect_if_logged_in


        user = User.new(params["user"])

        if user.save 
            session["user_id"] = user.id
            redirect to "/rentals"
        else
            redirect "/signup"
        end
    end

    get '/profile/:id' do
        redirect_if_not_logged_in
        redirect_if_not_authorized_user
    
        erb :'users/show'
    end
    
#update 1 user
    get '/profile/edit' do
        @user = current_user #don't need this
        erb :'users/edit'
    end

    put '/users/:id' do
        redirect_if_not_logged_in
        redirect_if_not_authorized_user
        # user = User.find_by_id(params[:id])
        # user.first_name = params[:first_name]
        # user.last_name = params[:last_name]
        # user.email = params[:email]
        # user.age = params[:age]
        # user.buildings_owned = params[:buildings_owned]

        if @user.update(params[:user])
            redirect to "/users/#{@user.id}"
        else
            #flash warning
            redirect to "/users/#{@user.id}/edit"
        end
    end

    delete '/users/:id' do
       redirect_if_not_logged_in
       redirect_if_not_authorized_user
        @user.destroy
       
        redirect to '/users'
    end

    private

    def redirect_if_not_authorized_user
        @user = User.find_by_id(params[:id])
        if @user.user_id != session[:user_id]
            redirect "/users"
        end
    end
end