class AddIndexesToProvince < ActiveRecord::Migration[5.1]
  def change
    change_table :provinces do |t|
      t.index [:upper_left_x, :bottom_right_x]
      t.index [:upper_left_y, :bottom_right_y]
    end
  end
end
