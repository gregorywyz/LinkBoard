class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "New user created!"
      redirect_to root_path
    else
      flash[:danger] = "Unable to create user"
      render :new
    end

  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password)
  end

end