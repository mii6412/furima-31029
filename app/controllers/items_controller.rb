class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    #@items = Item.all
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
    #@item = Item.find(params[:id])
    #unless @item.user == current_user
    #  redirect_to root_path
    #end
  end

  def update
    #@item = Item.find(params[:id])
    #if @item.update(item_params)
    #  redirect_to root_path
    #else
    #  render :edit
    #end
  end

  def destroy
    #@item = Item.find(params[:id])
    #if @item.destroy
    #  redirect_to root_path
    #end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :shipping_id, :departure_area_id, :duration_id, :price,).merge(user_id: current_user.id)
  end
end
