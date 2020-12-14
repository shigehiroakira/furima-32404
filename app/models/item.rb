class Item < ApplicationRecord

  with_options presence: true do
    validates :name

    with_options presence: true, format: {with:/\A([1-9]\d*,)*[1-9]\d*\z/} do
      validates :price
    end
    validates :price, inclusion: { in: 300..99999999 }
    
    validates :description
    validates :category_id, numericality: { other_than: 0} 
    validates :status_id, numericality: { other_than: 0 } 
    validates :shipping_cost_id, numericality: { other_than: 0 } 
    validates :prefecture_id, numericality: { other_than: 0 } 
    validates :shipping_day_id, numericality: { other_than: 0 }
    validates :image 
  end


  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :Prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_day
end
