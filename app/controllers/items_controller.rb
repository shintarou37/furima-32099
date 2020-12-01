class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.valid?
      @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @items = Item.find(params[:id])
  end

  def edit
    @items = Item.find(params[:id])
  end

  def update
    @items = Item.find(params[:id])
    if @items.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :delivery_fee_id, :day_id, :prefecture_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @items = Item.find(params[:id])
    redirect_to root_path if current_user.id != @items.user_id
  end
end
