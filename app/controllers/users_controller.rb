class UsersController < ApplicationController

  before_action :move_to_index

  def show
    @host_restaurant = Restaurant.where(host_id: current_user) 
    @attend_restaurant = UserRestaurant.where(attender_id: current_user)
  end
  
  def destroy
    @userrestaurant = UserRestaurant.where(attender_id: current_user.id, restaurant_id: params[:id])
    @user = UserRestaurant.find(@userrestaurant.ids[0])
    if @user.delete
    else
      redirect_to user_path
    end
  end

  private 

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
