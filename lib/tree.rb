class Tree
  def self.build(path, existing = {})
    _, head, tail = path.split('/',3)

    subheads = head.split('|')

    (1..subheads.length).each do |i|
      subheads.combination(i).each do |combo|
        self.build "/#{tail}", existing[combo.join('-')] ||= {}
      end
    end
    existing
  end

  def self.collapse(tree, path="")
    return path if tree.empty?
    path << '/' << tree.keys.reject{|k| k =~ /-/}.join('|')
    self.collapse(tree.values.first, path)
  end

  def self.synonym(tree, path)
    names = path.split('/').reject{|p| p == ''}
    target = names.pop
    parent = names.reduce(tree) { |memo, name| memo[name] }

    target_keys = parent[target].keys
    match = parent.reject{|k,_| k == target}
                  .detect([]){|(_,v)| v.keys == target_keys}[0]

    "/#{names.join('/')}/#{match}" if match
  end
end
