class Admin::OrdersController < ApplicationController
  def index
    @orders = OrderDetail.all
  end
  
  def new
    @order = Order.new
    Product.each { | p | @order.items.new(product_id: p.id, quantity: 0) }
  end

  def create
    @order = Order.new(order_params)
    @order.items.delete_if { | i | i.quantity == 0 }
    if (@order.save)
  end
end
