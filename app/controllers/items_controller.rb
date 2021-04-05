class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show, ]
  before_action :set_item, only: [:show, :edit, :update, :move_to_index]

  def  index
    @items = Item.all.order(created_at: :desc)
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
    @user = User.find_by(id: @item.user_id)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

 private

  def item_params
    params.require(:item).permit( :name, :version, :category_id, :status_id, :shipping_fee_burden_id, :delivery_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    
    if user_signed_in? && current_user.id != @item.user.id
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
