class ChangeShippingCostDataType < ActiveRecord::Migration[7.0]
  def change
    change_column :shipping_options, :price_per_item, :decimal
  end
end
