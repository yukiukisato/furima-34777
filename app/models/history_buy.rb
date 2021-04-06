class HistoryBuy
  include ActiveModel::Model
  attr_accessor :postal_code,:delivery_area_id,:municipality,:address,:building,:phone_number,:user_id,:buy_id,:item_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code
    validates :delivery_area_id
    validates :municipality
    validates :address
    validates :phone_number
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    history = History.create(user_id: user_id, item_id: item_id)
    Buy.create(postal_code: postal_code, delivery_area_id: delivery_area_id,municipality: municipality,address: address,building: building,phone_number: phone_number,history_id: history.id)
    
  end

end
