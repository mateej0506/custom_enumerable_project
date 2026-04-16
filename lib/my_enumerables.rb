module Enumerable
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    
    i = 0
    my_each do |element|
      yield(element, i)
      i += 1
    end
    self
  end

  def my_all?
    my_each do |element|
      return false if !yield(element)
    end
    true
  end


  def my_any?
    my_each do |element|
      return true if yield(element)
    end
    false
  end

  def my_none?
    my_each do |element|
      return false if yield(element)
    end
    true
  end

  def my_count
    count = 0
    my_each do |element|
      if block_given?
        count += 1 if yield(element)
      else
        count += 1
      end
    end
    count
  end

  def my_map
      return to_enum(:my_map) unless block_given?

    result = []
    my_each do |element|
      result << yield(element)
    end
    result
  end


  def my_select
      return to_enum(:my_select) unless block_given?
      
    result = []
    my_each do |element|
      result << element if yield(element)
    end
    result
  end 
end


class Array
  def my_each
    return to_enum(:my_each) unless block_given?
    
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end
end