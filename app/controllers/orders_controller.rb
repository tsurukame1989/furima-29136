class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @price = @item.price.to_s(:delimited)
  end

  def create
    @order_shipping = OrderShipping.create(order_shipping)
    if @order_shipping.valid?
      @order_shipping.save
      redirect_to action: :index
    else
      redirect_to item_orders_path(@item.id)
    end
  end

  private

  def order_shipping
    binding.pry
    params.require(:order_shipping).permit(:token, :postal_code, :delivery_source_id, :city, :house_number, :building_name, :phone_number)
  end
end
