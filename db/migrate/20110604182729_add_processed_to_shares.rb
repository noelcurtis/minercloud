class AddProcessedToShares < ActiveRecord::Migration
  def self.up
    add_column :shares, :processed, :boolean
  end

  def self.down
    remove_column :shares, :processed
  end
end
