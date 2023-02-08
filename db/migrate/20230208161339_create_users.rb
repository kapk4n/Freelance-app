class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :f_name
      t.string :l_name
      t.integer :sex
      t.string :password_digest
      t.integer :role

      t.timestamps
    end
  end
end
