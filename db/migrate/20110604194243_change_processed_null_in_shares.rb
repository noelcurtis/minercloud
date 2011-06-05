class ChangeProcessedNullInShares < ActiveRecord::Migration
  def self.up
    change_column :shares, :processed, :boolean, :null => false
  end

  def self.down
    change_column :shares, :processed, :boolean, :null => true
  end
end
