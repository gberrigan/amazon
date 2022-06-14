class User < ApplicationRecord
    validates :username, presence: true
    validates :password, presence: true

    has_secure_password

    has_many :cart_items

    def total_cart_value
        total_value = 0
        self.cart_items.each do |item|
           total_value += item.total_product_price
        end
        total_value
    end

end
