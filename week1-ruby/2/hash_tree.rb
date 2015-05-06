class Tree
  attr_reader :node_name, :children
  def initialize(hash)
    @node_name = hash.keys.first
    @children = hash[node_name].map do |key, child|
      Tree.new(key => child)
    end
  end

  def visit_all(&block)
    visit(&block)
    children.each { |c| c.visit_all(&block) }
  end

  def visit(&block)
    block.call self
  end
end

test_hash = {
  'grandpa' => { 
    'dad' => {
      'child 1' => {}, 
      'child 2' => {} 
      },
    'uncle' => {
      'child 3' => {}, 
      'child 4' => {} 
    }
  } 
}


ruby_tree = Tree.new(test_hash)

puts "Visiting a node"
ruby_tree.visit { |node| puts node.node_name }
puts

puts "visiting entire tree"
ruby_tree.visit_all { |node| puts node.node_name }
puts
