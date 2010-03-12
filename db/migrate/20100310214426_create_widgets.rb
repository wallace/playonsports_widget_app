class CreateWidgets < ActiveRecord::Migration
  def self.up
    create_table :widgets do |t|
      t.integer :branch_id
      t.text :notes
      t.string :version

      t.timestamps
    end
  end

  def self.down
    drop_table :widgets
  end
end
