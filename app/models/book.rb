class Book < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :isbn
  #validates_as_isbn :isbn
  validate :valid_isbn
  validate :positive_edition_number
  
  belongs_to :category, :class_name => "ClassName", :foreign_key => "category_id"
  
  private
  
  def positive_edition_number
    self.errors.add(:edition, "edition number must be positive") if edition_positive?
  end 
  
  def valid_isbn
    self.errors.add(:isbn, "Invalid ISBN") unless is_isbn_valid?(self.isbn)
  end
  
  def edition_positive?
     self.edition < 1
  end
  
  def is_isbn_valid?(isbn)
    unless(isbn.nil?)
      n = isbn.scan /[0-9]/
      case n.size 
      when 10
        is_isbn10_valid?(isbn)
      when 13
        is_isbn13_valid?(isbn)
      else
        false
      end
    end  
    
              
  end

  
  def is_isbn10_valid?(isbn)
    s = 0
    i = 10
    u = 0
    9.times do |n|
      s +=  isbn[n].chr.to_i * i
      i -= 1
    end
    u = isbn[9].chr.to_i
    return (11 - (s % 11)) == (isbn[9].chr.to_i)
  end
  
  def is_isbn13_valid?(isbn)
    s = 0
    12.times do |i|
      if i % 2 == 0
        s += isbn[i].chr.to_i * 1
      else
        s += isbn[i].chr.to_i * 3
      end
    end
    return (10 - (s % 10)) == (isbn[12].chr.to_i)
  end
  
end
