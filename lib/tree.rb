class Tree
  def self.build(path, existing = {})
    _, head, tail = path.split('/',3)

    subheads = head.split('|')

    parent = existing
    (1..subheads.length).each do |i|
      subheads.combination(i).each do |combo|
        Tree.build "/#{tail}", parent[combo.join('-')] ||= {}
      end
    end
    existing
  end
end
