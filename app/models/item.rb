class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :image

    with_options presence: true, format: { with: /\A([1-9]\d*,)*[1-9]\d*\z/ } do
      validates :price
    end
    validates :price, inclusion: { in: 300..99_999_999 }

    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :status_id
      validates :shipping_cost_id
      validates :prefecture_id
      validates :shipping_day_id
    end
  end

  belongs_to :user
  has_one_attached :image
  has_one :Purchase
  has_one :address

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :Prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_day
end
