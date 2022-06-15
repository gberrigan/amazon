class OrdersController < ApplicationController


    def create
       order = Order.new(order_params)
        order.user_id = current_user.id
        if order.save
            order_item_unsaved = false
            current_user.cart_items.each do |cart_item|
                ord_item = order.order_items.build(product_id: cart_item.product_id, our_price: cart_item.product.our_price, quantity: cart_item.quantity, shipping_option_id: cart_item.shipping_option_id)
                if ord_item.save
                else 
                    order_item_unsaved = true
                end 
            end

            if order_item_unsaved
            #    order.delete 
            else
                current_user.cart_items.delete_all
            end

          redirect_to products_path
        else
        end    
    end


private

def order_params
    params.require(:order).permit(:firstname, :lastname, :email, :address, :country, :state, :zipcode, :ccname, :ccnumber, :expiration, :cvv)
end

def refresh_shipping
    if current_user.non_member_free_shipping?
      current_user.cart_items.update_all(shipping_option_id: ShippingOption.find_by(name: '5 Day Free').id)
    end
  end

end
