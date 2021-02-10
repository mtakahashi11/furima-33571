class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    @item_purchases = ItemPurchase.new
  end

  def create
    @item_purchases = ItemPurchase.new(purchase_params)
    if @item_purchases.valid?
      @item_purchases.save
      pay_item
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:item_purchase).permit(:zip_code, :prefecture_id, :municipality, :street_number, :telephone_number, :building_name).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
