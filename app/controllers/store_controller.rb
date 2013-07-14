class StoreController < ApplicationController
  def index
    @products = Product.all
    @visit_times=session_times
  end

end
