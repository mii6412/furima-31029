class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only:[:show, :destroy, :edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
    
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
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :shipping_id, :departure_area_id, :duration_id, :price,).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
