require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id )
  end

  describe '商品出品' do

   context '商品出品ができるとき' do
      it '全ての入力が存在すれば登録できる' do
      expect(@item).to be_valid
      end
   end


   context '商品出品ができないとき' do

        it '画像が空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Image can't be blank"
        end

        it '商品の名前が空では登録できない' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Name can't be blank"
        end

        it '商品の説明が空では登録できない' do
          @item.version = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Version can't be blank"
        end

        it 'カテゴリーが空では登録できない' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Category is not a number"
        end

        it 'カテゴリーが1では登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Category must be other than 1"
        end

        it '商品の状態が空では登録できない' do
          @item.status_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include"Status is not a number"
        end

        it '商品の状態が1では登録できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include"Status must be other than 1"
        end

        it '配送料が空では登録できない' do
          @item.shipping_fee_burden_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include"Shipping fee burden is not a number"
        end

        it '配送料が1では登録できない' do
          @item.shipping_fee_burden_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include"Shipping fee burden must be other than 1"
        end

         it '配達エリアが空では登録できない' do
          @item.delivery_area_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include"Delivery area is not a number"
        end

        it '配達エリアが1では登録できない' do
          @item.delivery_area_id = 1
          @item.valid?
          
           expect(@item.errors.full_messages).to include"Delivery area must be other than 1"
         end

        it '配達日が空では登録できない' do
          @item.delivery_day_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Delivery day is not a number"
        end

        it '配達日が1では登録できない' do
          @item.delivery_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Delivery day must be other than 1"
        end

        it '金額が空では登録できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Price can't be blank"
        end

        it '金額が半角英数字混合では登録できない' do
          @item.price = '2435yjf'
          @item.valid?
          expect(@item.errors.full_messages).to include "Price is invalid"
        end

        it '金額が半角英字のみでは登録できない' do
          @item.price = 'dsfsggg'
          @item.valid?
          expect(@item.errors.full_messages).to include "Price is invalid"
        end

        it '金額が全角文字では登録できない' do
          @item.price = 'さAじ'
          @item.valid?
          expect(@item.errors.full_messages).to include "Price is invalid"
        end

        it '金額が299円以下では登録できない' do

          @item.price = 210
          @item.valid?
          expect(@item.errors.full_messages).to include "Price is invalid"
        end

        it '金額が10,000,000円以上では登録できない' do
          @item.price = 500000000000
          @item.valid?
          expect(@item.errors.full_messages).to include "Price is invalid"
        end

        it 'user_idが含まれていないとき登録できない' do
          @item.user_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "User must exist"
        end

    end
  end 
end 