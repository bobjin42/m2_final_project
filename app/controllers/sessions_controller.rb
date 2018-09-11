class SessionsController < ApplicationController
  def new

  end

  def create
    session[:id] = User.find_or_create_by(name: params[:name]).id
    redirect_to stores_path

  end
end
