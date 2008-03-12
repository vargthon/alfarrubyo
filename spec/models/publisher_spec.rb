require File.dirname(__FILE__) + '/../spec_helper'

describe Publisher do
  before(:each) do
    @valid_attributes = {
      :name => "My Publisher"
    }
    @publisher = Publisher.new
  end

  it "should be valid" do
    @publisher.should be_valid
  end
  
  it "should have a name"
  
end
