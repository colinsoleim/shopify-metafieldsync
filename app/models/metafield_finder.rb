class MetafieldFinder
  def initialize(metafield_parent)
    @metafield_parent = metafield_parent
  end

  def find_metafields
    @metafield_parent.metafields
  end
end
