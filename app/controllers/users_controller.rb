class UsersController < ApplicationController

  def show
  end
  
  def destroy
    @userrestaurant = UserRestaurant.where(user_id: current_user.id, restaurant_id: params[:id])
    @user = UserRestaurant.find(@userrestaurant.ids[0])
    if @user.delete
    else
      redirect_to user_path
    end
  end
end
