require File.dirname(__FILE__) + '/../spec_helper'

describe Author do
  before(:each) do
    @valid_attributes = {
      :name => "Vargthon Kepller de Oliveira Nunes"
    }
    @author = Author.new
  end

  it "should be valid" do
    @author.attributes = @valid_attributes
    @author.should be_valid
  end
  
  it "should require a name" do
    @author.save
    @author.should have(1).error_on(:name)
  end

end
