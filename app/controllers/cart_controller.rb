class CartController < ApplicationController

    def add_to_cart
    cart_item = CartItem.find_by(user: current_user, product_id: params.require(:product_id))
      if cart_item
        cart_item.quantity += 1
        cart_item.save
        flash[:notice] = "#{cart_item.name} has successfully been added to your cart (#{cart_item.quantity})"
        redirect_to products_path 
      else
        cart_item = CartItem.new(user: current_user, product_id: params.require(:product_id), quantity: 1)
        cart_item.save
        flash[:notice] = "#{cart_item.name} has successfully been added to your cart"
        redirect_to products_path 
      end
    end

end
