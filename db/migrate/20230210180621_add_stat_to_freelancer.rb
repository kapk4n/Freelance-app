class AddStatToFreelancer < ActiveRecord::Migration[7.0]
  def change
    add_column :freelancers, :status, :integer
    add_column :freelancers, :info, :string
    add_column :freelancers, :stack, :string
    add_column :freelancers, :education, :integer
    add_column :freelancers, :languag, :string
    add_column :freelancers, :experienc, :integer
  end
end
