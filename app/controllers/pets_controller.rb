class PetsController < ApplicationController

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(sub_params)
    # @pet.giver_id = session[:id]
    @pet.store_id = session[:store_id]
      if @pet.save
        @giving = Giving.create(giver_id: session[:id], pet_id: @pet.id)
        redirect_to giving_path(@giving)
      else
        render 'new'
      end
  end

  def show
    @pet = pet_find
  end

  def edit
    @pet = pet_find
  end

  def update
    @pet = pet_find
      if @pet.update(sub_params)
        redirect_to pet_path(@pet)
      else
        render 'edit'
      end
  end

  def destroy
    @pet = pet_find
    @pet.destroy
      redirect_to stores_path
  end

  private

  def sub_params
    params.require(:pet).permit(:name, :animal_type, :breed, :age, :color, :store_id)
  end

  def pet_find
    Pet.find(params[:id])
  end
end
