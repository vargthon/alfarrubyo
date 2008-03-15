class Book < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :isbn
  
  validate :isbn
  validate :positive_edition_number
  
  protected

  
  def isbn
    errors.add("invalid ISBN", :isbn) unless isbn_valid?(self.isbn)
  end
  
  def positive_edition_number
    errors.add("edition number must greater than 0", :edition) unless edition_positive?
  end
  
  
  def edition_positive
    edition > 0
  end
  
  def isbn_valid?(isbn)
    s = 0
    i = 10
    u = 0
    9.times do |n|
      s +=  isbn[n].chr.to_i * i
      i -= 1
    end
    u = isbn[9].chr.to_i
    (11 - (s % 11)) == (isbn[9].chr.to_i)
  end
  
#  private
#  def check_isbn
#    errors.add(:isbn, "invalid isbn") if isbn_valid?
#  end
  
end
