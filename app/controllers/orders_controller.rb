class OrdersController < ApplicationController
  def index
    
    @item = Item.find(params[:item_id])
    @save = Order.new
  end

  def create
    @save = Save.new(order_params)
    if @save.valid?
      @save.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def order_params
    params.require(:order).permit(:address,:prefecture_id,:town,:post,:build,:phone).merge(user_id: current_user.id,item_id: params[:item_id])
  end
end
