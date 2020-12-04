class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item
  before_action :redirect
  
  def index
    @save = Save.new
  end

  def create
    @save = Save.new(order_params)
    if @save.valid?
      pay_item
      @save.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:save).permit(:address,:prefecture_id,:town,:post,:build,:phone,:price).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy' 
      )   
  end

  def item
    @item = Item.find(params[:item_id])
  end

  def redirect
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
