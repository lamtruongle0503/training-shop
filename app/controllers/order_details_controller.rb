class OrderDetailsController < ApplicationController
  def create
    @order = current_order
    @order_detail = @order.order_items.new(order_detail_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.update_attributes(order_detail_params)
    @order_detail = @order.order_details
  end

  def destroy
    @order = current_order
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.destroy
    @order_details = @order.order_items
  end

  private

    def order_detail_params
      params.require(:order_detail).permit(:quantity, :product_id)
    end
end
