class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def cat
    @cats = Pet.all.select{|pet| pet.animal_type == "Cat"}
  end

  def dog
    @dogs = Pet.all.select{|pet| pet.animal_type == "Dog"}
  end

  def rabbit
    @rabbits = Pet.all.select{|pet| pet.animal_type == "Rabbit"}
  end

  def hamster
    @hamsters = Pet.all.select{|pet| pet.animal_type == "Hamster"}
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
    @user = User.find(session[:id])
  end

  def adoption
    byebug
    @pet = Pet.find(params[:pet_id])
    if session[:id] && !session[:id].empty?
      @adoption = Adoption.create(adoptor_id: session[:id], pet_id: @pet.id)
      @pet.status = false
      redirect_to user_path(@adoption.adoptor)
    else
      redirect_to new_user_path
    end
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
    params.require(:pet).permit(:name, :animal_type, :breed, :age, :gender, :store_id)
  end

  def pet_find
    Pet.find(params[:id])
  end
end
