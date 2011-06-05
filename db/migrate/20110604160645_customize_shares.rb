class CustomizeShares < ActiveRecord::Migration
  def self.up
    remove_column :shares, :time
    remove_column :shares, :created_at
    remove_column :shares, :updated_at
    
    #add create_at to auto set
    execute <<-SQL
      ALTER TABLE shares
        ADD created_at timestamp default now()
    SQL
  end

  def self.down
    remove_column :shares, :created_at
    
    add_column :shares, :time,  :integer
    add_column :shares, :created_at, :timestamp
    add_column :shares, :updated_at, :timestamp
  end
end
