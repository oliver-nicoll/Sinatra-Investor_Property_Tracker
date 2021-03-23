class IncomeController < ApplicationController
    get '/income' do
        @income = Income.all 
        erb :'income/index'
    end

    
    get '/income/:id' do
        @income = Income.find_by_id(params[:id])
        erb :'income/show'
    end
end