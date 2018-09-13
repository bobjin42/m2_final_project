class StoresController < ApplicationController


  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
    session[:store_id] = @store.id
  end

  def tips

  end

end
