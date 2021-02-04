class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :category_id, :price, :condition_id, :delivery_fee_id, :prefecture_id,
                                 :delivery_date_id, :description).merge(user_id: current_user.id)
  end
end
