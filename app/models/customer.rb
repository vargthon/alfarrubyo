class Customer < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :address
  
  #validates :valid_phone
  
  #private 
  #  def is_phone_valid?(phone)
  #    phone.
  #  end
end
