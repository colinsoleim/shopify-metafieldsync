class MetafieldFinder
  attr_accessor :metafields

  def initialize(metafield_parent)
    @metafield_parent = metafield_parent
    @metafields = find_metafields
  end

  def find_metafields
    @metafield_parent.metafields
  end
end
