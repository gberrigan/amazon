class Order < ApplicationRecord
    
    belongs_to :users
    belongs_to :products

    has_many :orders

end
