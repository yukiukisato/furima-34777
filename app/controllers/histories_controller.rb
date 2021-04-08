class HistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @history_buy = HistoryBuy.new
  end


  def create
    @history_buy = HistoryBuy.new(history_params)
    if  @history_buy.valid?
      pay_item
     
      @history_buy.save
      redirect_to root_path
    else
      render :index
    end
  end



  private

  def history_params
    params.require(:history_buy).permit(:postal_code, :delivery_area_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:@item.price,  
      card: history_params[:token],    
      currency: 'jpy'                 
    )
    
  end
  def move_to_index
    if  current_user.id == @item.user_id || @item.history.present?
      redirect_to  items_path
    end
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end

end
  