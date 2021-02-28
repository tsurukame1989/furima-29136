class ItemsController < ApplicationController
  # ログアウト状態のユーザーをログインページへ遷移させるメソッド
  before_action :authenticate_user!, except: [:index, :show]

  # ＠itemに特定のIDのパラメーターを代入するメソッド（同じ記述を減らすために定義）
  before_action :set_item, only: [:show, :edit, :update]

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
      save_redirect
    else
      render action: :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.valid?
      save_redirect
    else
      render action: :edit
    end
  end

  private
  def item_params 
    params.require(:item).permit(:image, :name, :info, :category_id, :condition_id, :delivery_fee_id, :delivery_source_id, :delivery_days_id, :price ).merge(user_id: current_user.id)
  end

  def save_redirect
    @item.save
    redirect_to action: :index
  end

  def set_item
    @item = Item.find(params[:id])
  end

end


