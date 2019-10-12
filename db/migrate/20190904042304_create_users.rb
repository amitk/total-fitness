class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :mobile, null: false
      t.string :email, null: false
      t.string :auth_token
      t.date :dob, null: false
      t.string :auth_token, null: false
      t.timestamps
    end
  end
end
