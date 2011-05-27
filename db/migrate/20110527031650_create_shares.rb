class CreateShares < ActiveRecord::Migration
  def self.up
    create_table :shares do |t|
      t.integer :time
      t.string :rem_host
      t.string :our_result
      t.string :upstream_result
      t.text :reason
      t.text :solution
      t.references :worker

      t.timestamps
    end
  end

  def self.down
    drop_table :shares
  end
end
