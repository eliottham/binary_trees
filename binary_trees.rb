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

	def call_print
		print_tree(@root)
	end

	def print_tree(current_node)
		return if current_node == nil
		print "R:#{current_node.value} " 
		if current_node.left != nil
			print "L:#{current_node.left.value} "
		end
		if current_node.right != nil
			print "R:#{current_node.right.value} "
		end
		print "\n"
		print_tree(current_node.left)
		print_tree(current_node.right)
	end
end



a = BinaryTree.new
a.build_tree([5, 7, 4, 23, 8, 9])
a.call_print

