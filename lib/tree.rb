class Tree
  def self.build(path, existing = {})
    _, head, tail = path.split('/',3)

    subheads = head.split('|')

    parent = existing
    subheads.each do |sub|
      Tree.build "/#{tail}", parent[sub] ||= {}
    end
    existing
  end
end
