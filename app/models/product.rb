class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :orders, through: :carted_products
  has_many :orders
 
  validates :name, :description, presence: true
  validates :price, numericality: {only_integer: true}
  validates :name, uniqueness: true

  DISCOUNT_THRESHOLD = 50
  SALES_TAX = 0.09

  def sale_item
    if price < DISCOUNT_THRESHOLD
      return "this kitty is on sale!"
    else "special price"
  end
end

  def sales_tax
    tax = price * SALES_TAX
    return tax
  end

  def total
    total = price + sales_tax.to_f
    return total
  end
end


