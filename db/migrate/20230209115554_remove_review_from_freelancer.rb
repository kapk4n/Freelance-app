class RemoveReviewFromFreelancer < ActiveRecord::Migration[7.0]
  def change
    remove_column :freelancers, :review, :string
  end
end
