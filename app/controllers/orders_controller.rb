class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @price = @item.price.to_s(:delimited)
  end

  private
end
