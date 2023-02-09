class RemoveStatFromOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :stat, :integer
  end
end
