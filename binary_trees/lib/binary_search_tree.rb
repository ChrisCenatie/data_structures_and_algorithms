class Node
  attr_reader :data
  attr_accessor :left, :right
  def initialize(data, left = nil, right = nil)
    @data  = data
    @left  = left
    @right = right
  end
end

class BinarySearchTree

  attr_reader :root_node, :count
  def initialize
    @root_node = nil
    @count = 0
  end

  def push(data, current_node = @root_node)
   if @root_node
     if data <= current_node.data
       if current_node.left.nil?
         current_node.left = Node.new(data)
       else
         @count += 1
         push(data, current_node.left)
       end
     else
       if current_node.right.nil?
         current_node.right = Node.new(data)
       else
         @count += 1
         push(data, current_node.right)
       end
     end
   else
     @count += 1
     @root_node = Node.new(data)
   end
 end

 def include?(data, current_node = @root_node)
   if current_node
     if current_node.data != data
       if current_node.data > data
         include?(data, current_node.left)
       elsif current_node.data < data
         include?(data, current_node.right)
       end
     elsif current_node.data == data
       true
     else
       false
     end
   else
     false
   end
 end

 def to_array(array = [], current_node = @root_node)
  if current_node
    array << current_node.data
    if !(current_node.left.nil?)
      to_array(array, current_node.left)
    end
    if !(current_node.right.nil?)
      to_array(array, current_node.right)
    end
  end
  array
 end

end
