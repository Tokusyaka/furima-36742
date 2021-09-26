class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string       :post_code,      null: false
      t.integer      :prefecture_id
      t.string       :municipalities, null: false
      t.string       :block_number,   null: false
      t.string       :phone,          null: false
      t.string       :building_name,  null: false
      t.references   :purchase,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
