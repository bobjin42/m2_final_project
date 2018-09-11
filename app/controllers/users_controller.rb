class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(sub_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to stores_path
      else
        render 'new'
      end
  end

  def show
    @user = user_find
  end

  def edit
    @user = user_find
  end

  def update
    @user = user_find
      if @user.update(sub_params)
        redirect_to user_path(@user)
      else
        render 'edit'
      end
  end

  def destroy
    @user = user_find
    @user.destroy
      redirect_to stores_path
  end

  private

  def sub_params
    params.require(:user).permit(:name, :password)
  end

  def user_find
    User.find(params[:id])
  end
end
