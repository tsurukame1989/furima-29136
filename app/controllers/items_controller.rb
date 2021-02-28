class ItemsController < ApplicationController
  # ログアウト状態のユーザーをログインページへ遷移させるメソッド
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # idの降順で表示
    @items = Item.all.order(id: "DESC")

    # Order機能の実装後コメントアウト解除
    # @orders = Order.all
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

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params 
    params.require(:item).permit(:image, :name, :info, :category_id, :condition_id, :delivery_fee_id, :delivery_source_id, :delivery_days_id, :price ).merge(user_id: current_user.id)
  end
end

