class ItemsController < ApplicationController
  # ログアウト状態のユーザーをログインページへ遷移させるメソッド
  before_action :authenticate_user!, except: [:index, :show]

  # ＠itemに特定のIDのパラメーターを代入するメソッド（同じ記述を減らすために定義）
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # 商品のuser.idと出品者のidが一致しない場合indexページへ遷移するメソッド
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    # idの降順で表示
    @items = Item.all.order(id: "DESC")
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
      redirect_to new_item_path, flash: { error: @item.errors.full_messages }
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :index
    else
      redirect_to edit_item_path, flash: { error: @item.errors.full_messages }
    end
  end

  def destroy
    @item.destroy
    redirect_to action: :index
  end


  private
  def item_params 
    params.require(:item).permit(:image, :name, :info, :category_id, :condition_id, :delivery_fee_id, :delivery_source_id, :delivery_days_id, :price ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @item.user.id
      redirect_to action: :index
    end
  end
end