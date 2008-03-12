require File.dirname(__FILE__) + '/../spec_helper'
  
describe Customer do
  before(:each) do
    @valid_attributes = {
      :name => "Vargthon",
      #:email => "vargthon@gmail.com",
      :phone => "82 88491406",
      :mobile => "82 88491406",
      :address => "Deputado jose lages"
    }
    @customer = Customer.new
  end

  it "should have a name" do
    @customer.attributes = @valid_attributes.except(:name)
    @customer.save
    @customer.should have(1).error_on(:name)
    @customer.name = @valid_attributes
    @customer.save 
    @customer.should be_valid
  end
  
  it "should have valid address" do
    @customer.save
    @customer.should have(1).error_on(:address)
    @customer.address = 'Rua Tal'
    @customer.save
    @customer.should have(:no).error_on(:address)
  end
  
  it "should have a valid email address" do
    @customer.save
    @customer.should have(1).error_on(:email)
    @customer.email = 'fiulano@example.com'
    @customer.save
    @customer.should have(:no).error_on(:email)
  end
  
  it "should have a city" do
    @customer.save
    @customer.should have(1).error_on(:city)
    @customer.city = 'Acme City'
    @customer.save
    @customer.should have(:no).error_on(:city)
  end
  
  it "should have a valid phone number" do
    @customer.save 
    @customer.should have(1).error_on(:phone)
    @customer.phone = 'abc'
    @customer.save
    @customer.errors[:phone].should include("can't have letters")
  end
end
