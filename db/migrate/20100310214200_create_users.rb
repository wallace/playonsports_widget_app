class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login
      t.string :password_salt
      t.string :persistence_token
      t.string :password
      t.string :role

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
