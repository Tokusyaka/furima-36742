class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, only: [:create, :index]
  def index
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new
  end

  def new
    @purchase_delivery = PurchaseDelivery.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      pay_item
      @purchase_delivery.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_delivery).permit(:post_code, :prefecture_id, :municipalities, :block_number, :phone, :building_name,
                                              :purchase_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user.id || @item.purchase.present?
  end
end
