class ChangeProcessedDefaultInShares < ActiveRecord::Migration
  def self.up
    change_column :shares, :processed, :boolean, :default => 0
  end

  def self.down
    change_column :shares, :processed, :boolean
  end
end
