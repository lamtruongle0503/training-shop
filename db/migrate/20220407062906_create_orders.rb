class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :payment_method, foreign_key: true
      t.integer :status ,default: 1
      t.float :sub_total

      t.timestamps
    end
  end
end
