class InvestorController < ApplicationController

    get '/investors/new' do
        erb :new
    end

    get '/investors' do
        @investors = Investor.all 
        erb :investors/index
    end

    
    get '/investors/:id' do
        @investor = Investor.find_by_id(params[:id])
        erb :show
    end

    get '/investors/:id/edit' do
        @investor = Investor.find_by_id(params[:id])
        erb :edit
    end

    patch '/investors/:id' do
        @investor = Investor.find_by_id(params[:id])
        @investor.name = params[:name]
        @investor.location = params[:location]
        @investor.save
        redirect to "/investors/#{@investor.id}"
    end

    post '/investors' do
        @investor = Investor.create(params)
        redirect to "/investor/#{@investor.id}"
    end

    delete '/investors/:id' do
        @investor = Investor.find_by_id(params[:id])
        @investor.delete
        redirect to '/investors'
    end
end