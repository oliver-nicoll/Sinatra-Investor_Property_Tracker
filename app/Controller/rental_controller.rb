class RentalController < ApplicationController

    get '/rentals' do
        @rentals = Rental.all 
        erb :'rental/index'
    end

    
    get '/rentals/:id' do
        @rental = Rental.find_by_id(params[:id])
        erb :'rentals/show'
    end

    get '/rentals/new' do
        erb :new
    end

      #update 1 rental
    get '/rentals/:id/edit' do
        @rental = Rental.find_by_id(params[:id])
        erb :'rental/edit'
    end

    #create new rental
    post '/rentals' do
        rental = Rental.new(params[:rental])

        if movie.save
            redirect to "/rentals/#{rental.id}"
        else
            "Error #{rental.errors.full_messages.join(", ")}"
            #flash message?
            sleep 5
            redirect to "/rentals/new"
        end
    end

    put '/rentals/:id' do
        rental = Rental.find_by_id(params[:id])
        rental.property_type = params[:property_type]
        rental.address = params[:address]
        rental.bedrooms = params[:bedrooms]
        rental.bathrooms = params[:bathrooms]
        rental.lease_length = params[:lease_length]
        rental.bathrooms = params[:monthly_rent]
        rental.bathrooms = params[:second_floor]
        rental.bathrooms = params[:pets_allowed]
        rental.bathrooms = params[:availability]
        
        if rental.update(params[:rental])
            redirect to "/rentals/#{rental.id}"
        else
            redirect to "/rentals/#{rental.id}/edit"
        end
    end

    delete '/rentals/:id' do
        rental = Rental.find_by_id(params[:id])
        rental.destroy
        #flash message
        redirect to "/rentals"
    end
end