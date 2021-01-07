require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @order = FactoryBot.build(:user_order)
  end

  describe '商品購入' do
    context '購入がうまくいくとき' do
      it "全ての値が正しく入力されれば購入ができること" do
        expect(@order).to be_valid
      end
      it "buildingの値が無くても購入ができること" do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it "tokenが空では購入できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "postcodeが空では購入できないこと" do
        @order.postcode = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postcode can't be blank")
      end
      it "postcodeのハイフンがないと購入できないこと" do
        @order.postcode = 1111111
        @order.valid?
        expect(@order.errors.full_messages).to include("Postcode ハイフンを入れて下さい")
      end
      it "prefectureが空では購入できないこと" do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空では購入できないこと" do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it "blockが空では購入できないこと" do
        @order.block = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Block can't be blank")
      end
      it "phone_numberが空では購入できないこと" do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberにハイフンがあると購入できないこと" do
        @order.phone_number = '090-1111222'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number ハイフンなしで入力")
      end
    end
  end
end