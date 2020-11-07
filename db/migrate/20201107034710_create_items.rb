class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name,          null: false     
      t.text :description,          null: false
      t.integer :category_id,       null: false
      t.integer :condition_id,      null: false
      t.integer :departure_area_id, null: false
      t.integer :shipping_id,       null: false
      t.integer :duration_id,       null: false
      t.integer :proce,             null: false
      t.references :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end

