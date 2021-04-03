class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def  index
    
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
    params.require(:item).permit( :name, :version, :category_id, :status_id, :shipping_fee_burden_id, :delivery_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
