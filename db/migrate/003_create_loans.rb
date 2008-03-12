class CreateLoans < ActiveRecord::Migration
  def self.up
    create_table :loans do |t|
      t.integer     :customer_id
      t.datetime    :borrowed_on 
      t.date        :due_at
      t.float       :overdue_fee
      t.text        :comment
      t.timestamps  
    end
  end

  def self.down
    drop_table :loans
  end
end
