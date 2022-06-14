class AddShippingOption < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :shipping_option_id, :integer
  end
end
