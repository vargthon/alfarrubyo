require File.dirname(__FILE__) + '/../spec_helper'

describe Copy do
  before(:each) do
    @copy = Copy.new
  end

  it "should be valid" do
    @copy.should be_valid
  end
end
