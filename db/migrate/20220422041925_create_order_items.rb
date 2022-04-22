class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true
      t.float :unit_price
      t.float :quantity
      t.float :total_price
      t.timestamps
    end
  end
end
