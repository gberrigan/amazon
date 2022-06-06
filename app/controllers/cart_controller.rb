class CartController < ApplicationController

    def add_to_cart
        cart_item = CartItem.new(user: current_user, product_id: params.require(:product_id), quantity: 1)
        cart_item.save
        flash[:notice] = "#{cart_item.name} has successfully been added to your cart"
        redirect_to products_path 
    end

end
