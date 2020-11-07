class Item < ApplicationRecord
  
  with_options presence: true do
    validates :item_name
    validates :description 
    validates :category_id 
    validates :condition_id 
    validates :departure_area_id
    validates :shipping_id
    validates :duration_id
    validates :price
    validates :user
  end

  belongs_to :user
  has_one :purchase
  has_one_attached :image

end
