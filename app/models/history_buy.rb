class HistoryBuy
  include ActiveModel::Model
  attr_accessor :postal_code,:delivery_area_id,:municipality,:address,:building,:phone_number,:user_id,:buy_id,:item_id,:token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :delivery_area_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :token
  end
  

  def save
    # 各テーブルにデータを保存する処理を書く
    history = History.create(user_id: user_id, item_id: item_id)
    Buy.create(postal_code: postal_code, delivery_area_id: delivery_area_id,municipality: municipality,address: address,building: building,phone_number: phone_number,history_id: history.id)
    
  end

end
