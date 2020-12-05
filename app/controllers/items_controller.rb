class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item, only: [:edit, :update, :show, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destory]
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
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :delivery_fee_id, :day_id, :prefecture_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path if current_user.id != @item.user_id || @item.order != nil
  end

  def item
    @item = Item.find(params[:id])
  end
end
