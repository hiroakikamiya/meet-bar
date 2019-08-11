class MessagesController < ApplicationController

  before_action :set_restaurant
  before_action :set_messages, only: [:index, :create]
  before_action :set_host, only: [:index, :create]
  before_action :set_attender, only: [:index, :create]

  def index
    @message = Message.new
  end

  def create
    @message = @restaurant.messages.new(message_params)
    if @message.save
      redirect_to restaurant_messages_path(@restaurant)
    else
      @messages = @restaurant.messages.includes(:user)
      flash[:notice] = 'メッセージを入力してください。'
      redirect_to restaurant_messages_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:message).merge(user_id: current_user.id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_messages
    @messages = @restaurant.messages.includes(:user)
  end

  def set_host
    @host = User.where(id: @restaurant.host_id)
  end

  def set_attender
    @restaurantuser = UserRestaurant.where(restaurant_id: @restaurant)
  end
end
