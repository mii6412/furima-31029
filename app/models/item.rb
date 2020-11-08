class Item < ApplicationRecord
  
  with_options presence: true do
    validates :image
    validates :item_name
    validates :description 
    validates :category_id, numericality: { other_than: 1 } 
    validates :condition_id, numericality: { other_than: 1 } 
    validates :shipping_id, numericality: { other_than: 1 } 
    validates :departure_area_id, numericality: { other_than: 1 } 
    validates :duration_id, numericality: { other_than: 1 } 
    validates :departure_area_id, numericality: { other_than: 1 } 
    validates :price
    validates :user
  end

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :shipping
    belongs_to :departure_area
    belongs_to :duration

end
