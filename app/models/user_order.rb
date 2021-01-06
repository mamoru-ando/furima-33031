class UserOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number

  with_options presence: true do
    # validates :token
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: "ハイフンを入れて下さい"}
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "ハイフンなしで入力" }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    binding.pry
    # 購入の情報を保存
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end