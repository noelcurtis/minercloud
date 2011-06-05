class CreateBlocks < ActiveRecord::Migration
  def self.up
    create_table :blocks do |t|
      t.integer :number
      t.integer :shares
      t.integer :duration
      t.string :category
      t.integer :confirmations
      t.references :worker

      t.timestamp :updated_at
    end
  end

  def self.down
    drop_table :blocks
  end
end
