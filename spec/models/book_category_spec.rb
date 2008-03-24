require File.dirname(__FILE__) + '/../spec_helper'

describe BookCategory do
  before(:each) do
    @valid_attributes = {
      :name => "My Book Category"
    }
    @book_category = BookCategory.new
  end

  it "should be valid" do
    @book_category.attributes = @valid_attributes
    @book_category.should be_valid
  end
  
  it "should have errors without a name" do
    @book_category.attributes = @valid_attributes.except(:name)
    @book_category.should have(1).error_on(:name)
  end
  
end
