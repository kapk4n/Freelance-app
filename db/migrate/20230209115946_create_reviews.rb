class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :freelancer, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.string :message
      t.integer :mark

      t.timestamps
    end
  end
end
