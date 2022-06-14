class CreateShippingOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_options do |t|

      t.string :option
      t.boolean :member_only
      t.integer :price_per_item
    end
  end
end
