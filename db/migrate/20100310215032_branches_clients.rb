class BranchesClients < ActiveRecord::Migration
  def self.up
    create_table :branches_clients, :id => false do |t|
      t.integer :client_id
      t.integer :branch_id
    end
  end

  def self.down
    drop_table :branches_clients
  end
end
