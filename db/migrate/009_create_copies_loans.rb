class CreateCopiesLoans < ActiveRecord::Migration
  def self.up
    create_table :copies_loans do |t|
        t.integer :loan_id
        t.integer :copy_id
    end
  end

  def self.down
    drop_table :table
  end
end
