module Enumerable
  # Your code goes here
  def my_all?
    my_each do |item|
      next if yield(item)

      return false
    end
    true
  end

  def my_any?
    my_each do |item|
      return true if yield(item)
    end
    false
  end

  def my_count
    i = 0
    my_each do |item|
      if block_given?
        i += 1 if yield(item)
      else
        i += 1
      end
    end
    i
  end

  def my_each
    for item in self
      if block_given?
        yield(item)
      else
        item
      end
    end
  end

  def my_each_with_index
    i = 0
    my_each do |item|
      [yield(item, i)]
      i += 1
    end
  end

  def my_select
    a = []
    my_each do |item|
      next unless yield(item)

      a << item
    end
    a
  end

  def my_none?
    my_each do |item|
      return false if yield(item)
    end
    true
  end

  def my_map
    a = []
    my_each do |item|
      a << yield(item)
    end
    a
  end

  def my_inject(start = 0)
    my_each do |item|
      start = yield(start, item)
    end
    start
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
end
