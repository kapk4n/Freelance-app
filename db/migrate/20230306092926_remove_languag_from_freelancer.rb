class RemoveLanguagFromFreelancer < ActiveRecord::Migration[7.0]
  def change
    remove_column :freelancers, :languag, :string
  end
end
