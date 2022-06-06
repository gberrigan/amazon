class CartItem < ApplicationRecord

    belongs_to :user
    belongs_to :product

    delegate :calculated_price, to: :product
    delegate :name, to: :product
end
