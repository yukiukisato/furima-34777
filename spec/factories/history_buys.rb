FactoryBot.define do
  factory :history_buy do
    postal_code {'123-4567'}
    delivery_area_id{6}
    municipality{'さいたま市'}
    address{'宮区3-3-3'}
    building{'都キャメル'}
    phone_number{'11122223333'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
