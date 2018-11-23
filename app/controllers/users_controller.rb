class UsersController < ApplicationController
  get '/signup' do
    erb :'/signup'
  end

  post '/signup' do
    @user = User.create(username: params[:user][:username], password: params[:user][:password])
    if @user.save
      session[:user_id] = @user.id
      redirect to "/users/#{@user.id}"
    else
      flash[:message] = "It looks like there was an error, please try again."
      redirect to "/signup"
    end
  end

  get '/users/:id' do
    if logged_in?
      @user = current_user
      erb :'/users/show'
    else
      redirect to '/login'
    end
  end

  get '/login' do
    erb :'users/login'
  end
end
