class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:update]
  
  def index
    @restaurants = Restaurant.order('id DESC').limit(5)
    count_userrestaurant(@restaurants)
  end

  def new
    @restaurant = Restaurant.new
    @restaurant.images.build
  end
  
  def create
    current_user.restaurants.create(restaurant_params)
    redirect_to root_path
  end
  
  def show
    @restaurants = Restaurant.where(reserve_date: params[:reserve_date])
    @reserve_date = params[:reserve_date]
    count_userrestaurant(@restaurants)
  end

  def update
    @userrestaurants = UserRestaurant.where(restaurant_id: @restaurant.id).count
    if @restaurant.capacity + 1 > @userrestaurants
      @restaurant.update(restaurant_params)
        redirect_to root_path(@restaurant)
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:catchcopy, :shop_name, :address, :price, :capacity, :reserve_date, :reserve_time, :comment,{ :user_ids => [] }, images_attributes: [:image, :restaurant_id])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def count_userrestaurant(restaurants)
    restaurants.each do |restaurant|
      @userrestaurants = UserRestaurant.where(restaurant_id: restaurant.id).count
    end
  end 
end

