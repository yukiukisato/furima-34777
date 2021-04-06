class HistoriesController < ApplicationController
  def index
    @history_buy = HistoryBuy.new
  end


  def create
    @history_buy = HistoryBuy.new(history_params)
    if @history_buy.valid?
      @history_buy.save
      redirect_to root_path
    else
      render :index
    end
  end



  private

  def history_params
    params.require(:history_buy).permit(:postal_code, :delivery_area_id, :municipality, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
