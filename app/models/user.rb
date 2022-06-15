class User < ApplicationRecord
    validates :username, presence: true
    validates :password, presence: true

    has_secure_password

    has_many :cart_items

    def total_item_value
        total_value = 0
        self.cart_items.each do |item|
           total_value += item.total_product_price
        end
        total_value
    end

    def total_shipping_cost
      shipping_cost = 0.00
      unless non_member_free_shipping?
        self.cart_items.each do |item|
            shipping_cost += (item.shipping_option.price_per_item * item.quantity)
        end
      end
      shipping_cost
    end

    def final_cost
        total_item_value + total_shipping_cost
    end

  private
    def non_member_free_shipping?
        !self.member_plus && self.total_item_value > 35.00
    end
end
