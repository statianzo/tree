class Tree
  def self.build(path, existing = {})
    _, head, tail = path.split('/',3)

    subheads = head.split('|')

    parent = existing
    (1..subheads.length).each do |i|
      subheads.combination(i).each do |combo|
        self.build "/#{tail}", parent[combo.join('-')] ||= {}
      end
    end
    existing
  end

  def self.collapse(tree, path="")
    return path if tree.empty?
    path << '/' << tree.keys.reject{|k| k =~ /-/}.join('|')
    self.collapse(tree.values.first, path)
  end
end
