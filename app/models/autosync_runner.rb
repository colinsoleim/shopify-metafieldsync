class AutosyncRunner < ApplicationRecord
  belongs_to :master_shop, class_name: "Shop"
  belongs_to :export_from_shop, class_name: "Shop"
  belongs_to :import_to_shop, class_name: "Shop"
end
