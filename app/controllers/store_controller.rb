class StoreController < ApplicationController
  def index
    @products = Product.all
    @visit_times=session_times
    @cart=current_cart
  end

end
