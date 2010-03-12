class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :client_id
      t.string :role
      t.string :name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
