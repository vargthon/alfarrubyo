class Book < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :isbn
  validates_as_isbn :isbn
  
  validate :positive_edition_number
  
  private
  
  def positive_edition_number
    self.errors.add(:edition, "edition number must be positive") if edition_positive?
  end 
  
  def edition_positive?
     self.edition < 1
  end

  
end
