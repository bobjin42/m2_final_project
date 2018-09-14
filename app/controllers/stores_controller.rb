class StoresController < ApplicationController


  def index
    @stores = Store.all
  end

  def tips

  end

  def show
    @store = Store.find(params[:id])
    session[:store_id] = @store.id
  end



end
