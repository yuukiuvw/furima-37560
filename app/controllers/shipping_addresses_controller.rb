class ShippingAddressesController < ApplicationController
  before_action :authenticate_user!, expect: [:create]
  before_action :contributor_confirmation, only: [:index,:create]
  before_action :set_item, only: [:index,:create]

  def index
    @shipping_address_purchase = ShippingAddressPurchase.new
  end

  def create
    @shipping_address_purchase = ShippingAddressPurchase.new(shipping_address_params)
    if @shipping_address_purchase.valid?
      pay_item
      @shipping_address_purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private

  def shipping_address_params
    params.require(:shipping_address_purchase).permit(:post_code,:prefecture_id,:municipality,:address,:building_name,:phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
 end

 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: shipping_address_params[:token],    
        currency: 'jpy'                 
      )
end

 def contributor_confirmation
  @item = Item.find(params[:item_id])
  if current_user == @item.user || @item.purchase.present?
  redirect_to root_path  
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
end