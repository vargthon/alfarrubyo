class CreateCustomerCategories < ActiveRecord::Migration
  def self.up
    create_table :customer_categories do |t|
      t.string :name, :limit => 120
      t.integer :max_allowed_books
      t.timestamps
    end
  end

  def self.down
    drop_table :customer_categories
  end
end
