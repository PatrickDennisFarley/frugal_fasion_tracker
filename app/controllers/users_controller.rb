class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User added successfully'
    else
      flash[:notice] = 'Error'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :phone_number,
      :encrypted_password
    )
  end
end
