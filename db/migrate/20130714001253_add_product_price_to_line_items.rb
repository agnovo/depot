class AddProductPriceToLineItems < ActiveRecord::Migration
  def self.up
    add_column :line_items, :product_price, :decimal, :default=>0, :precision=>8, :scale=>2
    LineItem.all.each do |item|
      item.product_price=item.product.price
      item.save
    end
  end

  def self.down
    remove_column :line_items, :product_price
  end
end
