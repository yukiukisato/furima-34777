require 'rails_helper'

RSpec.describe HistoryBuy, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: user.id )
    @history_buy = FactoryBot.build(:history_buy, user_id: user.id , item_id: @item.id)
    sleep 0.1 
  end

  describe '商品購入' do
    context '商品が購入できる時' do
      it '入力に不備がない時' do
        expect(@history_buy).to be_valid
      end

      it'建物名が空でも' do
        @history_buy.building = ''
        expect(@history_buy).to be_valid
      end
    end
    context '商品が購入できないとき' do
      it '郵便番号が空の時' do
      @history_buy.postal_code = ''
      @history_buy.valid?
      expect(@history_buy.errors.full_messages).to include "Postal code can't be blank"
      end

      it '郵便番号にハイフンがない時' do
      @history_buy.postal_code = '1234567'
      @history_buy.valid?
      expect(@history_buy.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
      end

      it '配達地域が空のとき' do
      @history_buy.delivery_area_id = ''
      @history_buy.valid?
      expect(@history_buy.errors.full_messages).to include "Delivery area can't be blank"
      end

      it'配達地域が１の時' do
      @history_buy.delivery_area_id = 1
      @history_buy.valid?
      expect(@history_buy.errors.full_messages).to include "Delivery area can't be blank"
      end

      it '市区町村が空のとき' do
      @history_buy.municipality = ''
      @history_buy.valid?
      expect(@history_buy.errors.full_messages).to include "Municipality can't be blank"
      end

      it '住所が空の時' do
      @history_buy.address = ''
      @history_buy.valid?
      expect(@history_buy.errors.full_messages).to include "Address can't be blank"
      end

      it '電話番号が空の時' do
      @history_buy.phone_number = ''
      @history_buy.valid?
      expect(@history_buy.errors.full_messages).to include "Phone number can't be blank"
      end

      it '電話番号が11桁の数値意外の時' do
        @history_buy.phone_number = '1234abcd'
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include "Phone number is invalid"
      end

      it '電話番号が12桁以上の時' do
        @history_buy.phone_number = '1234567891234'
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include "Phone number is invalid"
      end

      it "tokenが空では登録できないこと" do
        @history_buy.token = nil
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include"Token can't be blank"
      end

      it "use_idがない時" do
        @history_buy.user_id = nil
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include "User can't be blank"
      end

      it "item_idがない時" do
        @history_buy.item_id = nil
        @history_buy.valid?
        expect(@history_buy.errors.full_messages).to include "Item can't be blank"
      end



    end
  end
end
