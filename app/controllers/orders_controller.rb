class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    @user_order = UserOrder.new
  end

  def create
    binding.pry
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number)
                                  .merge(user_id: current_user.id, item_id: @item.id, token: params[:token], item_price: @item.price)
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'  
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
