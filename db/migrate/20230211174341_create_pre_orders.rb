class CreatePreOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :pre_orders do |t|
      t.references :order, null: false, foreign_key: true
      t.references :freelancer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
