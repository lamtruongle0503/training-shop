class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :imageable_id
      t.string :imageable_type

      t.timestamps
    end
  end
end
