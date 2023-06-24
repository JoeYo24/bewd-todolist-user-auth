class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save 
      render json: {
        user: {
          username: @user.username
        }
      }
    else
      render json: {
        success: false,
      }
    end
  end
  def destroy 
    @user = User.find_by(id: params[:id])

    if @user and @user.destroy 
      render json: {
        success: true
      }
    else
      render json: {
        success: false
      }
    end
  end

  private 

  def user_params 
    params.require(:user).permit(:username, :password)
  end
end
