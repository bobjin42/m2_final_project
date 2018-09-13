class PetsController < ApplicationController
  include SessionsHelper
  before_action :authorized, only:[:index, :new]

  def index
    @pets = Pet.all
  end

  def giving_new
    @pet = Pet.new
    render :_form
  end

  def giving_existing
    @pets = current_user.adoptor_pets.where(status: false)
    @pet = Pet.new
    render :_giving
  end

  def change_status
    params[:pet][:id].each do |id|
      if id != ""
        Pet.find(id).update(status: true)
        Giving.create(giver_id: session[:user_id], pet_id: id, giving_date: Time.now)
      end
    end
    redirect_to user_path(current_user)
  end

  def pet
    @store = Store.find(session[:store_id])
    @pets = @store.pets.all.select{|pet| pet.animal_type == params[:type] && pet.status == true}
  end

  def create
    @pet = Pet.new(sub_params)
    # @pet.giver_id = session[:user_id]
    @pet.store_id = session[:store_id]
      if @pet.save
        @giving = Giving.create(giver_id: session[:user_id], pet_id: @pet.id, giving_date: Time.now)
        redirect_to user_path(@giving.giver)
      else
        render 'new'
      end
  end

  def show
    @pet = pet_find
    @user = User.find(session[:user_id])
  end

  def adoption
    @pet = Pet.find(params[:pet_id])
    if session[:user_id]
      @pet.store_id = session[:store_id]
      @pet.status = false
      @pet.save
      @adoption = Adoption.create!(adoptor_id: session[:user_id], pet_id: @pet.id, adoption_date: Time.now)
      @user = @adoption.adoptor
      redirect_to user_path(@user)
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
