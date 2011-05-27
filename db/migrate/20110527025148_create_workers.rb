class CreateWorkers < ActiveRecord::Migration
  def self.up
    create_table :workers do |t|
      t.string :username
      t.string :password
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :workers
  end
end
