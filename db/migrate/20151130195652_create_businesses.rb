class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.integer :user_id
      t.integer :price_range
      t.string  :name
      t.string  :address
      t.string  :photo_url
      t.text    :description
      t.timestamps null: false
    end
  end
end
