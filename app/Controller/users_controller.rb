class UsersController < ApplicationController
    
    get '/signup' do
        redirect_if_logged_in

        erb :'users/new'
    end

    
    post '/signup' do
        redirect_if_logged_in


        user = User.new(params["user"])

        if user.save 
            session["user_id"] = user.id
            redirect to "/rentals"
        else
            flash[:notice] = "#{users.errors.full_messages.join(", ")}"
            redirect "/signup"
        end
    end

    get '/users/:id' do
        redirect_if_not_logged_in
        
        redirect_if_not_authorized
        
        erb :'users/show'
    end
    
#update 1 user - renders form
    get '/users/:id/edit' do
        redirect_if_not_logged_in
        redirect_if_not_authorized
        @user = current_user #don't need this
        erb :'users/edit'
    end
#save in db
    put '/users/:id' do
        redirect_if_not_logged_in
        redirect_if_not_authorized

        if current_user.update(params[:user])
            redirect to "/users/#{current_user.id}"
        else
            flash[:notice] = "#{current_user.errors.full_messages.join(", ")}"
            redirect to "/users/#{current_user.id}/edit"
        end
    end

    delete '/users/:id' do
       redirect_if_not_logged_in
       redirect_if_not_authorized_user
        @user.destroy
       
        redirect to '/users'
    end

    private

    def redirect_if_not_authorized
        @rental = Rental.find_by_id(params[:id])
        if @rental.user_id != session[:user_id]
            redirect "/rentals"
        end
    end
end