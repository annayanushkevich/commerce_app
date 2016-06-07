class CartedProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validate :qualtity_must_be_less_then_5

  def qualtity_must_be_less_then_5
    if quantity && quantity > 4
      errors.add(:quantity, "you can only buy 4 cats at a time!")
    end

  end

end
