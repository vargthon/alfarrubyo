require File.dirname(__FILE__) + '/../spec_helper'

describe Book do
  before(:each) do
    @valid_attributes = {
      :title => "My Book Title",
      :isbn => "0131016490",
      :released_at => Date.new,
      :edition => 1
    }
    @book = Book.new
  end

  it "should be valid" do
    @book.should be_valid
  end
  
  it "should have a title" do
    @book.attributes = @valid_attribues.except(:title)
    @book.save
    @book.should have(1).error_on(:title)
  end
  
  it "should have a valid ISBN" do
    @book.attributes = @valid_attribues.except(:isbn)
    @book.save
    @book.should have(1).error_on(:isbn)
    @book.isbn = @valid_attribues[:isbn]
    @book.
  end
  
  it "should have a unique ISBN"
  
  it "should have a positive edition numver"
  
  it "should belong to a publisher"
  
  it "should belong to a category"
  
end
