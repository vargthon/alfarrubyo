require File.dirname(__FILE__) + '/../spec_helper'

describe Book do
  before(:each) do
    @valid_attributes = {
      :title => "My Book Title",
      :isbn => "9751582701709",
      :released_at => Date.new,
      :edition => 1
    }
    @book = Book.new
  end

  it "should be valid with the right attributes" do
    @book.attributes = @valid_attributes
    @book.should be_valid
  end
  
  it "should have errors without a title" do
    @book.attributes = @valid_attributes.except(:title)
    @book.should have(1).error_on(:title)
  end
  
  it "should have errors without an ISBN" do
    @book.attributes = @valid_attributes.except(:isbn)
    @book.should have(1).error_on(:isbn)
  end
  
  it "should have errors on ivalid ISBN" do
    @book.attributes = @valid_attributes.except(:isbn)
    @book.isbn = "1NV71D158N"
    @book.isbn.should have(1).error_on(:isbn)
  end
  
  it "should have errors on negative edition numbers" do
    @book.attributes = @valid_attributes.except(:edition)
    @book.edition = -1
    @book.should have(1).error_on(:edition)
  end
  
  it "should have a unique ISBN"
  
  it "should belong to a publisher"
  
  it "should belong to a category"
  
end
