class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|

      t.string :name
      t.string :description
      t.decimal :list_price
      t.decimal :our_price
      t.string :image_location

      t.timestamps
    end
  end
end
