class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(iteme_params)
  end

  private

  def iteme_params
    params.require(:item).permit(:image, :name, :text, :price, :category_id, :status_id, :delivery_id, :delivery_days_id, :prefecture_id).merge(user_id: current_user.id)
  end
end
