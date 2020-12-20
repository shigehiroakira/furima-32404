class UserPurchase
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_code
    validates :prefecture_id
    validates :city
    validates :phone_number
    validates :address
    validates :token
  end
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :phone_number, format: { with: /\A0[5789]0?\d{4}?\d{4}\z/ }
  validates :phone_number, format: { with: /\A-?[0-9]+(\.[0-9]+)?\z/ }
  validates :address, format: { with: /\A([1-9]\d*,)*[1-9]\d*\z/ }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name,
                   phone_number: phone_number, purchase_id: purchase.id)
  end
end
