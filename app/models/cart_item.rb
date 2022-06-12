class CartItem < ApplicationRecord

    belongs_to :user
    belongs_to :product

    delegate :calculated_price, to: :product
    delegate :name, to: :product
    delegate :our_price, to: :product
    delegate :description, to: :product


    def total_product_price
        our_price * quantity
    end

    def total_cart_price
    end
end

