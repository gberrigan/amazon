class AddShippingOptionToOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_column :order_items, :shipping_option_id, :integer
  end
end
