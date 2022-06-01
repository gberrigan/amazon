class ProductsController < ApplicationController

    skip_before_action :authenticate!
    
    def index
        @products = Product.all
    end
end
