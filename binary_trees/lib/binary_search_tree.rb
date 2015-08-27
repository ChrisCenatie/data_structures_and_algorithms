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


end
