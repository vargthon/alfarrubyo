require File.dirname(__FILE__) + '/../spec_helper'

describe CustomerCategory do
  before(:each) do
    @valid_attributes = {
      :name => "My Customer Category"
    }
    @customer_category = CustomerCategory.new
  end

  it "should be valid" do
    @customer_category.attributes = @valid_attributes
    @customer_category.should be_valid
  end
  
  it "should have a name" do
    @customer_category.save
    @customer_category.should have(1).error_on(:name)
  end
  
end
