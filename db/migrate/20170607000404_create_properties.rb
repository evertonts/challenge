class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.integer :x
      t.integer :y
      t.integer :beds
      t.integer :baths
      t.integer :square_meters
      t.decimal :price, precision: 14, scale: 2
      t.string :description
      t.string :title
    end
  end
end
