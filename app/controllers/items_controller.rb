class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update, :destory]
  before_action :items, only: [:edit, :update,:show]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @items.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end
  # < 商品削除機能>
  def destroy
    @items = Item.find(params[:id])
    @items.destroy
    redirect_to root_path
  end
  # < 商品削除機能>

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :delivery_fee_id, :day_id, :prefecture_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @items = Item.find(params[:id])
    redirect_to root_path if current_user.id != @items.user_id
  end

  def items
    @items = Item.find(params[:id])
  end
end
