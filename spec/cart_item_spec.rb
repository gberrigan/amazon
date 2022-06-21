require "rails_helper"

describe CartItem do

    let! (:shipping_option){ShippingOption.create(id: 2, price_per_item: 1.99)}
    let! (:user) {User.create(id: 1, username: "GregB", password: "Password", password_confirmation: "Password", member_plus: 1)}
    let! (:product){Product.create(id: 1, name: "Hulk Hands", description: "Hulk Hands", our_price: 17.99)}
    let! (:cart_item){CartItem.create(id: 1, user_id: user.id, product_id: product.id, quantity: 2, shipping_option_id: shipping_option.id)}

    it 'calculates the total product price' do
        expect(cart_item.total_product_price).to eq(35.98)
    end
end