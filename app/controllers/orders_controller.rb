class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @price = @item.price.to_s(:delimited)
  end

  def create
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_shipping_params)
    if @order_shipping.valid?
      @order_shipping.save
      return redirect_to root_path
    else
      redirect_to item_orders_path(@item.id), flash: { error: @order_shipping.errors.full_messages }
    end
  end

  private

  def order_shipping_params
    params.permit(:postal_code, :delivery_source_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id).merge(user_id: current_user.id)
  end
end
