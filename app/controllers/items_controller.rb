class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(iteme_params)
    if @item.valid?
      @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private

  def iteme_params
    params.require(:item).permit(:image, :name, :text, :price, :category_id, :status_id, :delivery_id, :delivery_days_id,
                                 :prefecture_id).merge(user_id: current_user.id)
  end
end
