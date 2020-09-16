class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false, default:""
      t.integer :price, null: false
      t.text :text, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :shipping_area_id, null: false
      t.integer :delivery_time_id, null: false

      t.timestamps null: false
    end
  end
end