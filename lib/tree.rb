class Tree
  def self.build(path, existing = {})
    nodes = path.split('/')
                .reject{|p| p == ''}
                .map{|p|p.to_sym}

    parent = existing
    nodes.each do |node|
      parent = parent[node] ||= {}
    end
    existing
  end
end
