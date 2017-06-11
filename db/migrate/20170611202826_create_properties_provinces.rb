class CreatePropertiesProvinces < ActiveRecord::Migration[5.1]
  def change
    create_table :properties_provinces, id: false do |t|
      t.integer :property_id
      t.integer :province_id
    end
  end
end
