class CartsController < ApplicationController

    def index
      @order = Order.new
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
        cart_item = choose_default_shipping(cart_item)
        cart_item.save
        flash[:notice] = "#{cart_item.name} has successfully been added to your cart"
        redirect_to products_path 
      end
    end

    def update
        @cart_item = CartItem.find(params[:id])
        if params[:cart_item][:quantity].to_i == 0
          @cart_item.destroy
          flash[:notice] = "Item has successfully been removed from your cart"
          redirect_to confirm_cart_path
        else 
          if @cart_item.update(quantity: params[:cart_item][:quantity])
            flash[:notice] = "#{@cart_item.name} has successfully been updated"
            redirect_to confirm_cart_path
          else
          end
        end
    end

    def update_shipping
      shipping_option = ShippingOption.find_by(id: params[:shipping_option_id])
      current_user.cart_items.update_all(shipping_option_id: shipping_option.id)
      redirect_to confirm_cart_path
    end


private

    def cart_item_params
      params.require(:cart_item).permit(:id, :quantity)
    end

    def choose_default_shipping(cart_item)
      if current_user.cart_items.none?
        if current_user.member_plus
          cart_item.shipping_option_id = 1
        else
           cart_item.shipping_option_id = 4
        end
      else
        cart_item.shipping_option_id = current_user.cart_items.first.shipping_option_id
      end
      cart_item
    end
end
