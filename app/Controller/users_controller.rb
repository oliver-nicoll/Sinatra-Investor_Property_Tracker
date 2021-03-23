class UsersController < ApplicationController
    #handles the signup as well as editing or deleting a user account
    #signup route form
    get '/signup' do

    end

    #signup route post
    post '/signup' do

    end

    get '/investors' do
        @investors = Investor.all 
        erb :'investors/index'
    end

    
    get '/investors/:id' do
        @investor = Investor.find_by_id(params[:id])
        erb :'investors/show'
    end

    get '/investors/new' do
        erb :new
    end

    get '/investors/:id/edit' do
        @investor = Investor.find_by_id(params[:id])
        erb :'investor/edit'
    end

    post '/investors' do
        investor = Investor.new(params[:investor])
        
        if investor.save
            redirect to "/investors/#{investor.id}"
        else
            #flash message
            redirect to "/investors/new"
        end
    end

    put '/investors/:id' do
        investor = Investor.find_by_id(params[:id])
        investor.name = params[:name]
        investor.location = params[:location]
        
        if investor.update(params[:investor])
            redirect to "/investors/#{investor.id}"
        else
            #flash warning
            redirect to "/investors/#{investor.id}/edit"
        end
    end

    delete '/investors/:id' do
        investor = Investor.find_by_id(params[:id])
        investor.destroy
        #flash message
        redirect to '/investors'
    end
end