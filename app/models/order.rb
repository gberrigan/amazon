class Order < ApplicationRecord
    
    validates :firstname, presence: true
    validates :lastname, presence: true

    validates :email, presence: true
    validates :address, presence: true
    validates :country, presence: true
    validates :state, presence: true, length: {is: 2}
    validates :zipcode, presence: true, numericality: { only_integer: true }

    #CC information
    validates :payment_type, presence: true
    validates :ccname, presence: true
    validates :ccnumber, presence: true, length: {is: 16}, numericality: { only_integer: true } 
    validates :expiration, presence: true
    validates :cvv, presence: true, length: {is: 3}, numericality: { only_integer: true }

    
    

    belongs_to :user
    

    has_many :order_items

end
