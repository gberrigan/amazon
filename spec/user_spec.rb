require "rails_helper"

describe User do
    let! (:shipping_option){ShippingOption.create(id: 2, price_per_item: 1.99)}
    let! (:user) {User.create(id: 1, username: "GregB", password: "Password", password_confirmation: "Password", member_plus: 1)}
    let! (:product){Product.create(id: 1, name: "Hulk Hands", description: "Hulk Hands", our_price: 17.99)}
    let! (:cart_item){CartItem.create(id: 1, user_id: user.id, product_id: product.id, quantity: 1, shipping_option_id: shipping_option.id)}
    
    it 'calculates the user total item price' do
        expect(user.total_item_value).to eq(17.99)
    end

    it 'calculates the total cost of shipping' do
        expect(user.total_shipping_cost).to eq(1.99)
    end

    it 'calculates the final cost of an order' do 
        expect(user.final_cost).to eq(19.98)
    end
end 