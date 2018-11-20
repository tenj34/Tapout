class UsersController < ApplicationController
  get '/signup' do
    erb :'/signup'
  end

  get '/login' do
    erb :'users/login'
  end
end
