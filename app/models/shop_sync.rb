class ShopSync < ApplicationRecord
  belongs_to :master_shop, class_name: "Shop"
  belongs_to :export_from_shop, class_name: "Shop"
  belongs_to :import_to_shop, class_name: "Shop"

  def start
    self.started_at = Time.now
    self.status = "In Progress"

    start_products
    start_collections

    save!
  end

  def start_products
    products_to_sync = export_from_shop.products
    products_to_sync.each do |product|
      ShopifyThrottledWorker.perform_async(
        service: "ProductSyncer",
        args: MultiJson.dump(
          shop_id: import_to_shop_id,
          product_id: product.id,
        ),
      )
    end
  end

  def start_collections
    # collections_to_sync = export_from_shop.collections
    # collections_to_sync.each do |collection|
    #   ShopifyThrottledWorker.perform_async(
    #     service: "ProductSyncer",
    #     args: MultiJson.dump(
    #       shop_id: import_to_shop_id,
    #       product_id: product.id,
    #     ),
    #   )
    # end
  end
end
