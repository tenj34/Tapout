class UsersController < ApplicationController

  get '/users/:id' do
    if logged_in?
      @user = current_user
      erb :'/users/show'
    else
      redirect to '/login'
    end
  end

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

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect to "/users/#{current_user.id}"
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect to "/users/#{@user.id}"
    else
      flash[:message] = "It looks like there was an error, please try again."
      redirect to "/login"
    end
  end

  get "/logout" do
    if logged_in?
      session.clear
      redirect "/login"
    else
      redirect '/'
    end
  end

end
