class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      
      t.references :order
      t.references :product
      t.decimal :our_price
      t.string :quantity
  

      t.timestamps
    end
  end
end
