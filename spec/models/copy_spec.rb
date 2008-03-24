require File.dirname(__FILE__) + '/../spec_helper'

describe Copy do
  
  before(:each) do
    @valid_attributes = {:copy_number => 0101, :}
    @copy = Copy.new
  end

  it "should be belongs to a book" do
    @copy.book << books(:camisa)
    @product_category.products.should include(products(:camisa))
  end

  it "should be valid with the right attributes" do
    @copy.should be_valid
  end
end
