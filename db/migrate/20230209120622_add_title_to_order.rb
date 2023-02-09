class AddTitleToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :title, :string
    add_column :orders, :cost, :integer
    add_column :orders, :message, :string
  end
end
