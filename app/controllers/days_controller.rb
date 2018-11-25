class DaysController < ApplicationController

  get "/days/new" do
    if logged_in?
      @user = current_user
      erb :'days/new'
    else
      redirect to '/login'
    end
  end

  post 'days' do
    if logged_in?
      if @day.save
        @day = @current_user.days.build(params[:days])
        redirect "/users/#{current_user.id}"
      else
        redirect'/days/new'
      end
    else
      redirect to '/login'
    end
  end


end
