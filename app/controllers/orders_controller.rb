class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
    # binding.pry
      @user_order.save
      redirect_to root_path
    else
    #  binding.pry
      render :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number)
                                  .merge(user_id: current_user.id, item_id: @item.id)
    end
end
