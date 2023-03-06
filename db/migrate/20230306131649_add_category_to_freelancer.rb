class AddCategoryToFreelancer < ActiveRecord::Migration[7.0]
  def change
    add_column :freelancers, :category, :integer
  end
end
