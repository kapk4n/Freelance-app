class RemoveEducFromFreelancer < ActiveRecord::Migration[7.0]
  def change
    remove_column :freelancers, :education, :integer
  end
end
