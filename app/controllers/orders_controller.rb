class OrdersController < ApplicationController

    def create
        puts params
        order = Order.new(order_params)
        order.user_id = current_user.id
        if order.save
            order_item_unsaved = false
            current_user.cart_items.each do |cart_item|
             ord_item = order.order_items.build(product_id: cart_item.product_id, our_price: cart_item.product.our_price, quantity: cart_item.quantity)
             if ord_item.save
             else 
                order_item_unsaved = true
             end 
            end
            puts "Order Items Saved " + order_item_unsaved.to_s
            if order_item_unsaved
            #    order.delete 
            else
                current_user.cart_items.delete_all
            end
          redirect_to products_path
        else
            #redirect_to checkout with notice
        end    
    end


private

def order_params
    params.require(:order).permit(:firstname, :lastname, :email, :address, :country, :state, :zipcode, :ccname, :ccnumber, :expiration, :cvv)
end

end
