class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :payment_method
  has_many :order_details,  dependent: :destroy

  PAYMENT_TYPES = [ "Cash on delivery", "Ngân lượng", "Bảo Kim", "Bank Card" ]
  def add_line_items_from_cart(cart,order_id) 
    cart.each do |item|
      # byebug
        order_details << OrderDetail.create!( order_id: order_id, product_id: item["product_id"] , quantity: item["quantity"], price: item["price"])
    end
  end
end
