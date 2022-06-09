class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      
      t.references :user
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :address
      t.string :country
      t.string :state
      t.integer :zipcode
      t.string :ccname
      t.integer :ccnumber
      t.date :expiration
      t.integer :cvv
      t.timestamps
    end
  end
end
