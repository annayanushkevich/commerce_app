class ItemsController < ApplicationController

def index
end

  def first_item
   @first_item = Item.all[0].name
   @first_price = Item.all[0].price
  end

  def index
    @items = Item.all
  end

end
