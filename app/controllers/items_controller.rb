class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.valid?
      @item.save
      redirect_to action: :index
    else
      render  action: :new
    end
  end

  private
  def item_params 
    params.require(:item).permit(:image, :name, :info, :category_id, :condition_id, :delivery_fee_id, :delivery_source_id, :delivery_days_id, :price ).merge(user_id: current_user.id)
  end
end

