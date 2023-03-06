class AddCategoryToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :category, :integer
  end
end
