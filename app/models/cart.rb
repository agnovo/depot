class Cart < ActiveRecord::Base
  has_many :line_items,:dependent=>:destroy
  
  def total_item
    line_items.sum(:quantity)
  end
  
  def total_price
    #line_items.to_a.sum{|itme| item.total_price }
    total=0
    line_items.each do |item|
      total=total+item.total_price
    end
    total
  end
  
  def add_product(product_id)
    current_item=line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity+=1
    else
      current_item=line_items.build(:product_id=>product_id)
      current_item.product_price=Product.find(product_id).price
    end
    current_item
  end
end
