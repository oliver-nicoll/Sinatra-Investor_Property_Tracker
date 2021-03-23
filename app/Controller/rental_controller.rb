class RentalController < ApplicationController

    get '/rentals/new' do
        erb :new
    end

    get '/rentals' do
        @rental = Rental.all 
        erb :rentals/index
    end

    
    get '/rentals/:id' do
        @rental = Rental.find_by_id(params[:id])
        erb :show
    end

    get '/rentals/:id/edit' do
        @rental = Rental.find_by_id(params[:id])
        erb :edit
    end

    patch '/rentals/:id' do
        @rental = Rental.find_by_id(params[:id])
        @rental.owner = params[:owner]
        @rental.address = params[:address]
        @rental.bedrooms = params[:bedrooms]
        @rental.bathrooms = params[:bathrooms]
        @rental.save
        redirect to "/rentals/#{@rental.id}"
    end

    post '/rentals' do
        @rental = Rental.create(params)
        redirect to "/rentals/#{@rental.id}"
    end

    delete '/rentals/:id' do
        @rental = Rental.find_by_id(params[:id])
        @rental.delete
        redirect to '/rentals'
    end

end