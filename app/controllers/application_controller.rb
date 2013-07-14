class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  # set the current_cart function private in the application controller ,
  # so only the application controller can use this method
  private
    def session_times
      if session[:count].nil?
        session[:count]=1
      else
        session[:count]=session[:count]+1
      end
      session[:count]
    end  
  
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart=Cart.create
      session[:cart_id]=cart.id
      cart
    end
end 
