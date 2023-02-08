class AddStatToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :stat, :integer
  end
end
