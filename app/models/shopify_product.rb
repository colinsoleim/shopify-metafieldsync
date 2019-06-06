class ShopifyProduct
  def pull_metafields_from(shop, scope = "all")
    SyncMetafields.call(
      pull_metafields_into_shop: self,
      pull_metafields_from_shop: shop,
      scope: scope,
    )
  end
end
