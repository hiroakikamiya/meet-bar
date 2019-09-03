class RestaurantsController < ApplicationController
  respond_to :html
  before_action :set_restaurant, only: [:update, :show]
  before_action :move_to_index, except: [:date, :index]
  
  def index
    @restaurants = Restaurant.order('id DESC').limit(4)
    @message_restaurants = []
    if user_signed_in?
      @message_restaurants += Restaurant.where(host_id: current_user.id)
      @attend_restaurants = UserRestaurant.where(attender_id: current_user.id)
      @attend_restaurants.each do |attend_restaurant|
        @message_restaurants += Restaurant.where(id: attend_restaurant.restaurant_id)
      end
    end

    if params[:keyword].blank?
    else
      split_keyword = params[:keyword].split(/[[:blank:]]+/)
      @result_restaurants = []
      split_keyword.each do |keyword|
        next if keyword == ""
        @result_restaurants += Restaurant.where('catchcopy LIKE(?)', "%#{keyword}%")
        @result_restaurants += Restaurant.where('address LIKE(?)', "%#{keyword}%")
        @result_restaurants += Restaurant.where('comment LIKE(?)', "%#{keyword}%")
        @result_restaurants += Restaurant.where('shop_name LIKE(?)', "%#{keyword}%")
        @result_restaurants += Restaurant.where('price LIKE(?)', "%#{keyword}%")
        @result_restaurants += Restaurant.where('capacity LIKE(?)', "%#{keyword}%")
      end
      @result_restaurants.uniq!
    end

  end

  def new
    @restaurant = Restaurant.new
  end

  def search
    
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end
  
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to root_path
    else
      respond_with @restaurant, location: new_restaurant_path
    end
  end
  
  def date
    @restaurants = Restaurant.where(reserve_date: params[:reserve_date])
    @reserve_date = params[:reserve_date]
  end

  def update
    @userrestaurants = UserRestaurant.where(restaurant_id: @restaurant.id).count
    if @restaurant.capacity > @userrestaurants
      if  @restaurant.update(user_restaurent_params)
        redirect_to root_path(@restaurant)
      else
        redirect_to root_path
      end
    end
  end

  def meet_update
    
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:catchcopy, :shop_name, :address, :price, :capacity, :reserve_date, :reserve_time, :comment, :image).merge(host_id: current_user.id)
  end

  def user_restaurent_params
    params.require(:restaurant).permit({ :attender_ids => [] })
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

end

