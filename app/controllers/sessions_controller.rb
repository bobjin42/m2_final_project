class SessionsController < ApplicationController


  def new

  end

  def create

    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      # session[:id] = User.find_or_create_by(name: params[:name]).id
      redirect_to stores_path
    else
      flash[:notice] = "Invalid username or password"
      redirect_to login_path
    end
  end

  def destroy
    log_out
    redirect_to stores_path
  end
end
