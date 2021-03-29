class RentalController < ApplicationController

    get '/rentals' do
        redirect_if_not_logged_in

        @rentals = current_user.rentals 
        erb :'rental/index'
    end

    get '/rentals/new' do
        redirect_if_not_logged_in

        erb :'rental/new'
    end

   
    post '/rentals' do
        redirect_if_not_logged_in

        rental = current_user.rentals.build(params[:rental])

        if rental.save
            redirect to "/rentals/#{rental.id}"
        else
            flash[:error] = "#{rental.errors.full_messages.join(", ")}"
            redirect to "/rentals/new"
        end
    end

    get '/rentals/:id' do
        redirect_if_not_logged_in
        redirect_if_not_authorized
    
        erb :'rental/show'
    end

    
    get '/rentals/:id/edit' do
        redirect_if_not_logged_in
        redirect_if_not_authorized

        erb :'rental/edit'
    end

    
    put '/rentals/:id' do
        redirect_if_not_logged_in
        redirect_if_not_authorized
    
        if @rental.update(params["rental"])
            redirect to "/rentals/#{@rental.id}"
        else
            flash[:error] = "#{rental.errors.full_messages.join(", ")}"
            redirect to "/rentals/#{@rental.id}/edit"
        end
    end

    delete '/rentals/:id' do
        redirect_if_not_logged_in
        redirect_if_not_authorized

        @rental.destroy

        redirect to "/rentals"
    end

    private

    def redirect_if_not_authorized
        @rental = Rental.find_by_id(params[:id])

        if @rental.user_id != session[:user_id]
            redirect "/rentals"
        end
    end

end