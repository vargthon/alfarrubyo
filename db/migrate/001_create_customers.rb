class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name, :limit => 100, :null => false
      t.string :phone, :limit => 20
      t.string :mobile, :limit => 20
      t.string :address, :limit => 100
      t.string :email, :limit => 150
      t.string :city, :limit => 50
      t.boolean :is_blocked
      t.datetime :blocked_at
      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
