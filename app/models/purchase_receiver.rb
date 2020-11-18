class PurchaseReceiver
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :price, :zip_code, :departure_area_id, :address, :street_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :zip_code
    validates :departure_area_id
    validates :address
    validates :street_number
    validates :phone_number
    validates :token
  end

  validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' } , length: { maximum: 8 }
  validates :phone_number, format: { with: /\A[0-9]{,11}\z/ }, length: { minimum: 9, maximum: 11 }
  validates :departure_area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Receiver.create(zip_code: zip_code, departure_area_id: departure_area_id, address: address, street_number: street_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end