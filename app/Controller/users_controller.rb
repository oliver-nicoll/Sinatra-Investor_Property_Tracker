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
            flash[:notice] = "#{user.errors.full_messages.join(", ")}"
            redirect "/signup"
        end
    end

    get '/profile' do
        redirect_if_not_logged_in
        
        erb :'users/show'
    end
    
    get '/profile/edit' do
        redirect_if_not_logged_in
        @user = current_user #don't need this 
        erb :'users/edit'
    end

    put '/profile' do
        redirect_if_not_logged_in

        if current_user.update(params[:user])
            redirect to "/profile"
        else
            flash[:notice] = "#{current_user.errors.full_messages.join(", ")}"
            redirect to "/profile/edit"
        end
    end

    delete '/profile' do
       redirect_if_not_logged_in
    
        current_user.destroy
       
        redirect to '/'
    end

end