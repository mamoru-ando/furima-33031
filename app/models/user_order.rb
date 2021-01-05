class UserOrder
  include ActiveModel::Model
  attr_accessor :user, :item, :postcode, :prefecture_id, :city, :blok, :building, :phone_number, :order

  with_options presence: true do
    validates :token
    validates :postcode #, numericality: { with: ^\d{3}-\d{4}$, message: "ハイフンを入れて下さい"}
    validates :city
    validates :blok
    validates :phone_number #, numericality: { with: ^0\d{9,10}$, message: "can't be blank" }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    # 住所の情報を保存
    Address.create(postcode: postcode, prefecture: prefecture, city: city, blok: blok, building: building, user_id: user.id, order_id: order.id)
    # 寄付金の情報を保存
    Order.create(item: item, user_id: user.id)
  end
end