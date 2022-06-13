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

    def update
        @cart_item = CartItem.find(params[:id])
        if params[:cart_item][:quantity].to_i == 0
          @cart_item.destroy
          redirect_to confirm_cart_path
          #notice Item successfully removed
        else 
          # if @cart_item.update(cart_item_params)
          if @cart_item.update(quantity: params[:cart_item][:quantity])
            redirect_to confirm_cart_path
          else
            #notice Item successfully updated
          end
        end
    end

private

    def cart_item_params
      params.require(:cart_item).permit(:id, :quantity)
    end

end
