require File.dirname(__FILE__) + '/../spec_helper'
require 'date'

describe Loan do
  before(:each) do
    @valid_attributes = {
      :borrowed_on => Time.new,
      :due_at => Date.new,
      :overdue_fee => 10.0,
      :comments => "Comentoarios quaisquer"
    }
    @loan = Loan.new
  end

  it "should be valid" do
    @loan.should be_valid
  end
  
  it "should belongs to a customer"
  
  it "should have at least one copy of a book"
  
  it "should have a due date"
  
  it "should have a borrowed date"
  
  it "should not have a borrowed date greater than a due date"
  
end
