class Tree
  attr_accessor :children, :value

  def initialize(hash)
    if hash.keys.size > 1
      puts "wrong structure, can't have more than one value per node"
    end
    @value = hash.keys[0]
    @children = hash[@value].map {|value, children| Tree.new({value => children})}
  end

  def visit(&block)
    block.call self
  end

  def visit_all(&block)
    visit(&block)
    children.each {|child| child.visit_all(&block)}
  end
end

tree = Tree.new({:a => {:b1 => {:c1 => {}, :c2 => {}}, :b2 => {}}})
tree.visit_all {|node| puts node.value}
