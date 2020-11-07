class Item < ApplicationRecord
  
  with_options presence: true do
    validates :item_name
    validates :description 
    validates :category_id, numericality: { other_than: 1 } 
    validates :condition_id 
    validates :shipping_id
    validates :departure_area_id
    validates :duration_id
    validates :departure_area_id
    validates :price
    validates :user
  end

  belongs_to :user
  has_one :purchase
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :departure_area
  belongs_to :duration

end
