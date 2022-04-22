class Product < ActiveRecord::Base
  has_many_attached :images
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products
  has_many :order_details
  has_many :orders, through: :order_details

  validates :code, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  
  default_scope { order(created_at: :desc) }
  scope :ordered_by_name, -> { order(name: :desc) }
  scope :ordered_by_price, -> { order(name: :desc) }
  scope :search_name, ->(name) { where("name LIKE ?", "%#{name}%") if name.present? }
  scope :search_product, lambda { |params|
    search_name(params[:name])
  }
end
