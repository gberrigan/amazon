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
        if current_user.member_plus
          cart_item.shipping_option_id = 1
        else
          cart_item.shipping_option_id = 4
        end
        cart_item.quantity += 1
        cart_item.save
        flash[:notice] = "#{cart_item.name} has successfully been added to your cart (#{cart_item.quantity})"
        redirect_to products_path 
      else
        cart_item = CartItem.new(user: current_user, product_id: params.require(:product_id), quantity: 1)
        if current_user.member_plus
          cart_item.shipping_option_id = 1
        else
          cart_item.shipping_option_id = 4
        end
        cart_item.save
        flash[:notice] = "#{cart_item.name} has successfully been added to your cart"
        redirect_to products_path 
      end
    end

    def update
        @cart_item = CartItem.find(params[:id])
        if params[:cart_item][:quantity].to_i == 0
          @cart_item.destroy
          flash[:notice] = "#{cart_item.name} has successfully been removed from your cart"
          redirect_to confirm_cart_path
        else 
          if @cart_item.update(quantity: params[:cart_item][:quantity])
            flash[:notice] = "#{@cart_item.name} has successfully been updated"
            redirect_to confirm_cart_path
          else
          end
        end
    end

private

    def cart_item_params
      params.require(:cart_item).permit(:id, :quantity)
    end

    def choose_shipping
      if current_user.member_plus
        cart_item.shipping_option_id = 1
      else
        cart_item.shipping_option_id = 4
      end
    end
end
