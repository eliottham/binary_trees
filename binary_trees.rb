class Node
	attr_accessor :value, :parent, :left, :right
	def initialize(value=nil)
		@value = value
		@parent = nil
		@left = nil
		@right = nil
	end
end

class BinaryTree
	def initialize
		@root = nil
	end

	def build_tree(data_array)
		@root = Node.new(data_array[0])

		for i in 1..data_array.length-1
			add_node(Node.new(data_array[i]), @root)
		end
	end

	def add_node(node, current_root)
		if node.value == current_root.value
			return
		end

		if node.value < current_root.value
			if current_root.left == nil
				current_root.left = node
				node.parent = current_root
				return
			elsif node.value > current_root.left.value
				node.left = current_root.left
				current_root.left.parent = node
				current_root.left = node
				node.parent = current_root
				return
			elsif node.value < current_root.left.value
				new_current_root = current_root.left
				add_node(node, new_current_root)
			end
		end

		if node.value > current_root.value
			if current_root.right == nil
				current_root.right = node
				node.parent = current_root
				return
			elsif node.value < current_root.right.value
				node.right = current_root.right
				current_root.right.parent = node
				current_root.right = node
				node.parent = current_root
				return
			elsif node.value > current_root.right.value
				new_current_root = current_root.right
				add_node(node, new_current_root)
			end
		end
	end

	def breadth_first_search(target_value)
		queue = Array.new
		queue.push(@root)

		while queue.any? { |node| node != nil }
			return queue[0] if queue[0].value == target_value
			queue << queue[0].left if queue[0].left != nil
			queue << queue[0].right if queue[0].right != nil
			queue.shift
		end
		return nil
	end

	def depth_first_search(target_value)
		stack = Array.new
		stack.push(@root)

		until stack.empty?
			node = stack.pop
			return node if node.value == target_value
			stack << node.left if node.left != nil
			stack << node.right if node.right != nil
		end
		return nil
	end




	def print_tree(current_node=@root)
		return if current_node == nil
		print "ROOT:#{current_node.value} " 
		if current_node.left != nil
			print "L:#{current_node.left.value} "
		else
			print "L: "
		end
		if current_node.right != nil
			print "R:#{current_node.right.value} "
		else
			print "R: "
		end
		print "\n"
		print_tree(current_node.left)
		print_tree(current_node.right)
	end
end



a = BinaryTree.new
a.build_tree([5, 7, 4, 23, 8, 9])
a.print_tree
test = a.breadth_first_search(4)
puts "node: #{test} value: #{test.value}"
test2 = a.depth_first_search(23)
puts "node: #{test2} value: #{test2.value}"

