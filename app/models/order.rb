class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :payment_method
  has_one :order_detail
  has_many :line_items
  has_many :products, through: :line_items
end
