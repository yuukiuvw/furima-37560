class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update,:destroy]
  before_action :authenticate_user!, except: [:index,:show]
  before_action :contributor_confirmation, only: [:edit,:update,:destroy]

  def index
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
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
    params.require(:item).permit(:image, :product_name, :explanation, :price, :category_id, :product_condition_id, :shipping_charge_id,
                                 :prefecture_id, :days_to_ship_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    if current_user != @item.user || @item.purchase.present?
      redirect_to root_path
    end
    end
  end

  