class DaysController < ApplicationController

  get "/days/new" do
    if logged_in?
      @user = current_user
      erb :'days/new'
    else
      redirect to '/login'
    end
  end
end
