class AddIndexesToProperty < ActiveRecord::Migration[5.1]
  def change
    change_table :properties do |t|
      t.index :x
      t.index :y
    end
  end
end
