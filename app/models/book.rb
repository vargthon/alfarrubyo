class Book < ActiveRecord::Base
  
#  validate :check_isbn
  
  def isbn_valid?(isbn)
    
  end
  
#  private
#  def check_isbn
#    errors.add(:isbn, "invalid isbn") if isbn_valid?
#  end
  
end
