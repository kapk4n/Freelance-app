class AddEducationToFreelancer < ActiveRecord::Migration[7.0]
  def change
    add_column :freelancers, :education, :string
  end
end
