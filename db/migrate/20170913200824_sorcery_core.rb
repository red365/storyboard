class SorceryCore < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :forename,          :null => false
      t.string :surname,           :null => false
      t.string :email,             :null => false
      t.string :crypted_password,  :null => false
      t.string :salt,              :null => false
      t.integer :is_admin,         :null => false

      t.timestamps                :null => false
    end

    add_index :users, :email, unique: true
  end
end
