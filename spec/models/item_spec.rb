require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品登録" do
    context '商品登録がうまくいくとき' do
      it "image, name, text, category_id, status_id, delivery_id,
          delivery_days_id, priceが全て存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it "imageが選択されてないと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "nameが空だと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it "textが空だと登録できない" do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Text can't be blank"
      end
      it "categoryが選択されてないと登録できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "statusが選択されていないと登録できない" do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it "deliveryが選択されていないと登録できない" do
        @item.delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery can't be blank"
      end
      it "prefectureが選択されていないと登録できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "delivery_daysが選択されていないと登録できない" do
        @item.delivery_days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery days can't be blank"
      end
      it "priceが空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "priceが全角では登録できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid. Input half-width characters."
      end
      it "priceが299以下だと登録できない" do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it "priceが10000000以上だと登録できない" do
        @item.price = "10000001"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
    end
  end
end