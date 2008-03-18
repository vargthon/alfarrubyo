module ValidaISBN  
  def self.is_isbn_valid?(isbn)
    n = isbn.scan /[0-9]/
    if isbn.length == n.size
      case n.size 
      when 10
        is_isbn10_valid?(isbn)
      when 13
        is_isbn13_valid?(isbn)
      else
        false
      end
    else
      false
    end
  end
  
  private
  
  def self.is_isbn10_valid?(isbn)
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
  
  def self.is_isbn13_valid?(isbn)
    s = 0
    12.times do |i|
      if i % 2 == 0
        s += isbn[i].chr.to_i * 1
      else
        s += isbn[i].chr.to_i * 3
      end
    end
    (10 - (s % 10)) == (isbn[12].chr.to_i)
  end  
  
end



module ActiveRecord
  module Validations
    module ClassMethods
      def validates_as_isbn(*attr_names)
        configuration = {:message => "invalid ISBN"}
        configuration.update(attr_names.pop) if attr_names.last.is_a?(Hash)
        
        validates_each(attr_names, configuration) do |record, attr_name,value|
          value_before_type_cast = record.send("#{attr_name}_before_type_cast")
          
          next if value.empty?
                    
          record.errors.add(attr_name, configuration[:message]) unless ValidaISBN::is_isbn_valid?(value)
        end # validates_each
      end #validates_as_isbn
    end # ClassMethods
  end # Validations
end # ActiveRecord
