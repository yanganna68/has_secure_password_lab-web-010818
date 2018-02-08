class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to '/login' unless user
    session[:user_id] = user.id
    @user = user
    redirect_to '/'
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end

end
