class Product < ApplicationRecord

has_many :cart_items
has_many :order_items

    def calculated_price
        self.our_price*1.125
    end

end
