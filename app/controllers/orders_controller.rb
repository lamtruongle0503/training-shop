class OrdersController < ApplicationController
  
  def index
    @orders = current_user.orders.paginate(page: params[:page], per_page: 4)
  end

  def new
    @cart = current_cart
    if @cart.empty?
      flash[:info] = "Your Cart is empty"
      redirect_to root_url
    end
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
      @order.add_line_items_from_cart(current_cart, @order.id)
        if @order.save
            session[:cart] = nil
            redirect_to carts_path
        else
          flash[:info] = "Your Cart is empty"
          redirect_to root_url
        end
  end

  private

    def order_params
      params.require(:order).permit(:payment_method_id,:user_id)
    end

  
end
