class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      # session[:id] = User.find_or_create_by(name: params[:name]).id
      redirect_to stores_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to stores_path
  end
end
