class CreateReceivers < ActiveRecord::Migration[6.0]
  def change
    create_table :receivers do |t|
      t.string :zip_code,       null: false
      t.integer :departure_area_id, null: false
      t.string :address,        null: false
      t.string :street_number,  null: false
      t.string :phone_number,   null: false
      t.string :building_name
      t.references :purchase,   null: false, foreign_key: true
      t.timestamps
    end
  end
end


