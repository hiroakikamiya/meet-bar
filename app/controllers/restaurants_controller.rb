class RestaurantsController < ApplicationController
  respond_to :html
  before_action :set_restaurant, only: [:update]
  before_action :move_to_index, except: [:show, :index]
  
  def index
    @restaurants = Restaurant.order('id DESC').limit(5)
    count_userrestaurant(@restaurants)
  end

  def new
    @restaurant = Restaurant.new
    @restaurant.images.build
    @image = Image.new
  end
  
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to root_path
    else
      respond_with @restaurant, location: new_restaurant_path
    end
  end
  
  def show
    @restaurants = Restaurant.where(reserve_date: params[:reserve_date])
    @reserve_date = params[:reserve_date]
    count_userrestaurant(@restaurants)
  end

  def update
    @userrestaurants = UserRestaurant.where(restaurant_id: @restaurant.id).count
    if @restaurant.capacity > @userrestaurants
      @restaurant.update(user_restaurent_params)
      redirect_to root_path(@restaurant)
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:catchcopy, :shop_name, :address, :price, :capacity, :reserve_date, :reserve_time, :comment, images_attributes: [:image, :restaurant_id]).merge(host_id: current_user.id)
  end

  def user_restaurent_params
    params.require(:restaurant).permit({ :attender_ids => [] })
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def count_userrestaurant(restaurants)
    restaurants.each do |restaurant|
      @userrestaurants = UserRestaurant.where(restaurant_id: restaurant.id).count
    end
  end 

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

end

