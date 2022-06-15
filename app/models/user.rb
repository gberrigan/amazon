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

    def total_shipping_cost
        shipping_cost = 0
        self.cart_items.each do |item|
            shipping_cost += (item.shipping_option.price_per_item * item.quantity)
        end
        shipping_cost
    end
end
