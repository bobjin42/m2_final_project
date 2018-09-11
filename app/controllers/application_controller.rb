class ApplicationController < ActionController::Base

  # protect_from_forgery with: :exception, prepend: true

  def current_user
    session[:name]
  end
end
