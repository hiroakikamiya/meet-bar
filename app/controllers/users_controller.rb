class UsersController < ApplicationController 
  respond_to :html
  before_action :move_to_index

  def show
    @user = User.find(params[:id])
    @host_restaurant = Restaurant.where(host_id: @user.id) 
    @attend_restaurant = UserRestaurant.where(attender_id: @user.id)
  end
  
  def edit
  end

  def update
    if current_user.update!(user_params)
      redirect_to user_path, method: :get
    else
      render :edit
    end
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

  # def password_required?
  #   if do_validate
  #     !persisted? || !password.nil? || !password_confirmation.nil?
  #   else
  #     false
  #   end
  # end

  def user_params
    params.require(:user).permit(:avatar, :name, :comment, :email, :password, :password_confirmation)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
