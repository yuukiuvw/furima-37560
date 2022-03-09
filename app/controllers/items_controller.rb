class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new]
  def index
    @items = Item.all
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :price, :category_id, :product_condition_id, :shipping_charge_id,
                                 :prefecture_id, :days_to_ship_id).merge(user_id: current_user.id)
  end
end
