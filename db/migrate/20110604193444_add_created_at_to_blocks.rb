class AddCreatedAtToBlocks < ActiveRecord::Migration
  def self.up
      #add create_at to auto set
      execute <<-SQL
        ALTER TABLE blocks
          ADD created_at timestamp default now()
      SQL
  end

  def self.down
    remove_column :blocks, :created_at
  end
end
