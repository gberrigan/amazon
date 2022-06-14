class CartItem < ApplicationRecord

    belongs_to :user
    belongs_to :product
    belongs_to :shipping_option

    delegate :calculated_price, to: :product
    delegate :name, to: :product
    delegate :our_price, to: :product
    delegate :description, to: :product


    def total_product_price
        our_price * quantity
    end

end

