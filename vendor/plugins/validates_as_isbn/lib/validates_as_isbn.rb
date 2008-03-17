module ValidaISBN
  def self.is_isbn10_valid?(isbn)
    unless(isbn.length  != 10)
      s = 0
      i = 10
      u = 0
      9.times do |n|
        s +=  isbn[n].chr.to_i * i
        i -= 1
      end
      u = isbn[9].chr.to_i
      result = (11 - (s % 11)) == (isbn[9].chr.to_i)
    else
      result = false
    end
  end
  
  def self.is_isbn13_valid?(isbn)
    unless(isbn.length != 13)
      s = 0
      12.times do |i|
        if i % 2 == 0
          s += isbn[i].chr.to_i * 1
        else
          s += isbn[i].chr.to_i * 3
        end
      end
      result = (10 - (s % 10)) == (isbn[12].chr.to_i)
    else
      result = false
    end
  end
  
  def self.is_isbn_valid?(isbn)
    
    
  end
  
  
end



module ActiveRecord
  module Validations
    module ClassMethods
      def validates_as_isbn(*attr_names)
        configuration = {:message => "ISBN inválido"}
        configuration.update(attr_names.pop) if attr_names.last.is_a?(Hash)
        
        validates_each(attr_names, configuration) do |record, attr_name,value|
          value_before_type_cast = record.send("#{attr_name}_before_type_cast")
          
          next if value.empty?
          
          unless ValidaISBN::is_valid?(value)
            record.errors.add(attr_name, configuration[:message])
          end
        end
      end
    end
  end
end
