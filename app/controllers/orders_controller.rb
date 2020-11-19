class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :sold_out
  before_action :set_item

  def index
    @purchase_receiver = PurchaseReceiver.new
  end

  def create
    @purchase_receiver = PurchaseReceiver.new(purchase_params)
    if @purchase_receiver.valid?
      pay_item
      @purchase_receiver.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_receiver).permit(:zip_code, :departure_area_id, :address, :street_number, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id], price: @item.price)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: purchase_params[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path if user_signed_in? && current_user.id == Item.find(params[:item_id]).user.id 
  end

  def sold_out
    redirect_to root_path if Purchase.exists?(item_id: params[:item_id])
  end
end
