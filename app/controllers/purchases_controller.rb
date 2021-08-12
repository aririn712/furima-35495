class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :find_params
  before_action :not_seller, only: [:index, :create]
  before_action :sold_out_item, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:post_code, :area_id, :municipality, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def find_params
    @item = Item.find(params[:item_id])
  end

  def not_seller
    redirect_to root_path if current_user.id == @item.user_id
  end

  def sold_out_item
    redirect_to root_path if @item.purchase.present?
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: purchase_address_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
