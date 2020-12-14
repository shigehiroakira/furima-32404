class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :price
    validates :description
    validates :category_id, numericality: { other_than: 1 } 
    validates :status_id, numericality: { other_than: 1 } 
    validates :shipping_cost_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :shipping_day_id, numericality: { other_than: 1 } 
  end


  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_cost
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_day
end
