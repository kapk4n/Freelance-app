class AddFreelToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :freelanc_id, :integer
  end
end
