#Q1******************************************************************************************************

# Basic bubble sort to sort a array
def bubble_sort(arr)
  n = arr.length

  #Check all elements of array
  for i in 0..n-2
    for j in 0..n-i-2
      if arr[j] > arr[j+1]
        arr[j], arr[j+1] = arr[j+1], arr[j]
      end
    end
  end

  return arr
end

#Inbuilt Sort method in array: Array#sort
#Q1******************************************************************************************************

#Q2******************************************************************************************************
=begin 
Singleton Class: In Ruby, Singleton class is a class that has only one instance.
Can be defined using obj.define_singleton_method method.
Example: Rails.logger is having global accessibility as the concept of singleton

=end
#Q2******************************************************************************************************
#Q3******************************************************************************************************
#Append in Array (push)
arr = [1,2,3]
arr.push(4)
puts arr
#output: [1,2,3,4]
#Prepend in Array (unshift)
arr = [1,2,3]
arr.unshift(0)
puts arr
#output: [0,1,2,3]
#Q3******************************************************************************************************
#Q4******************************************************************************************************
#LinkedList

class Node
  attr_accessor :data, :next_node

  def initialize(data)
    @data = data
    @next_node = nil
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(data)
    new_node = Node.new(data)
    if @head.nil?
      @head =  new_node
    else
      current_node = @head
      while current_node.next_node
        current_node = current_node.next_node     
      end
      current_node.next_node = new_node
    end
  end

  def delete(data)
    current_node = @head
    if current_node && current_node.data == data
      @head = current_node.next_node
    else
      while current_node.next_node && current_node.next_node.data != data 
        current_node = current_node.next_node
      end

      if current_node.next_node
        current_node.next_node = current_node.next_node.next_node
      end
    end
  end

  def traverse
    current_node = @head
    while current_node
      puts current_node.data
      current_node = current_node.next_node
    end
  end

  def print_data_reverse_order
    return if @head.nil?

    print_data_reverse_order(@head.next_node)
    puts @head.data
  end
end


#Q4******************************************************************************************************

