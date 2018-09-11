class GivingsController < ApplicationController
  def new
    @giving = Giving.new
  end

  def show
    @giving = Giving.find(params[:id])
  end

end
