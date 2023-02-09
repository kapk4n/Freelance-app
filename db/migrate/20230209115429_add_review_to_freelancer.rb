class AddReviewToFreelancer < ActiveRecord::Migration[7.0]
  def change
    add_column :freelancers, :review, :string
  end
end
