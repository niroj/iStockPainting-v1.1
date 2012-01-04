class ChangeColumnCategoryIdFromPaintings < ActiveRecord::Migration
  def change
    change_column :paintings, :category_id, :integer, :default => 1
  end
end
