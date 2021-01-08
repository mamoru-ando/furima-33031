require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order = FactoryBot.build(:user_order, item_id: item.id, user_id: user.id)
    sleep(0.1)
  end

  describe '商品購入' do
    context '購入がうまくいくとき' do
      it '全ての値が正しく入力されれば購入ができること' do
        expect(@order).to be_valid
      end
      it 'buildingの値が無くても購入ができること' do
        @order.building = nil
        expect(@order).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'tokenが空では購入できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'postcodeが空では購入できないこと' do
        @order.postcode = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postcodeのハイフンがないと購入できないこと' do
        @order.postcode = 1111111
        @order.valid?
        expect(@order.errors.full_messages).to include('郵便番号はハイフンを入れて下さい')
      end
      it 'prefectureが0以外でないと購入できないこと' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'cityが空では購入できないこと' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'blockが空では購入できないこと' do
        @order.block = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空では購入できないこと' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberにハイフンがあると購入できないこと' do
        @order.phone_number = '090-1111222'
        @order.valid?
        expect(@order.errors.full_messages).to include('電話番号はハイフンなしで入力してください')
      end
      it 'user_idが空では購入できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空では購入できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
