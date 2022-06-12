class CartsController < ApplicationController

    def index
      @cart_items = CartItem.where(user: current_user)
    end

    def show
      @cart_items = CartItem.where(user: current_user)
    end

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

    def edit
      @cart_item = CartItem.where(user: current_user)
    end

    def edit_qty
    end

    def update
        @cart_item = CartItem.where(user: current_user)
        if @cart_item.update!(cart_item_params)
          redirect_to confirm_cart_path
        else 
          redirect_to confirm_cart
        end
    end

private

    def cart_item_params
      params.require(:cart_item).permit(:quantity)
    end

end
