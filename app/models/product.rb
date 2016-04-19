class Product < ActiveRecord::Base

  DISCOUNT_THRESHOLD = 50
  SALES_TAX = 0.09

  def sale_item
    if price < DISCOUNT_THRESHOLD
      return "this kitty is on sale!"
    else "special price"
  end
end

  def sales_tax
    @tax = price * SALES_TAX
    return "tax: #{@tax}"
  end

  def total
    @total = price + sales_tax.to_f
    return " total: #{@total}"
  end
end


