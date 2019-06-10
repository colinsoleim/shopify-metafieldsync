class MetafieldSyncsController < AuthenticatedController
  def index
    @metafield_syncs = @shop.metafield_syncs
  end
end
