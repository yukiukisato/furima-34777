require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
describe 'ユーザー新規登録' do
  context '新規登録できるとき' do
     it 'nickname,email,password,password_confirmation,姓,名,姓カナ,名カナ,生年月日が存在すれば登録できる' do
      expect(@user).to be_valid
     end
     it 'emailに@が含まれていると登録できる' do
      @user.email = 'aaaa@aaaa'
      expect(@user).to be_valid
     end
     it 'passwordが６文字以上で半角英数字のとき登録できる' do
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      expect(@user).to be_valid
     end
     it '姓が全角（漢字・ひらがな・カタカナ)であれば登録できる' do
      @user.last_name = '佐藤'
      expect(@user).to be_valid  
     end
     it '名が全角（漢字・ひらがな・カタカナ)であれば登録できる' do
      @user.first_name = 'ユウキ'
      expect(@user).to be_valid  
     end
     it 'last_name_katakanaは全角（カタカナ）であれば登録できる' do
      @user.last_name_katakana = 'サトウ'
      expect(@user).to be_valid 
     end
     it 'first_name_katakanaは全角（カタカナ）であれば登録できる' do
      @user.first_name_katakana = 'ユウキ'
      expect(@user).to be_valid 
     end
  end
  context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailは@が含まれていないと登録できない' do
      @user.email = 'aaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it '同じemailは登録できない' do
      @user.save
      another = FactoryBot.build(:user)
      another.email = @user.email
      another.valid?
      expect(another.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが半角数字のみの場合は登録できない' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
    end
    it 'passwordが半角英字のみの場合は登録できない' do
      @user.password = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
    end
    it 'passwordが全角の場合は登録できない' do
      @user.password = 'ＡＢＣ１２３'
      @user.password_confirmation = 'ＡＢＣ１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password confirmation is invalid", "Password is invalid")
    end
    it '姓が空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it '姓は全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.last_name = 'aaaaAAAA'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name 全角文字を使用してください"
    end
    it '名が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.first_name = 'aaaaAAAA'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
    end
    it '姓(カナ)が空では登録できない' do
      @user.last_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name katakana can't be blank"
    end
    it 'last_name_katakanaは全角（カタカナ）でなければ登録できない' do
      @user.last_name_katakana = 'あfdgs@'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name katakana 全角カタカナのみで入力して下さい"
    end
    it '名(カナ)が空では登録できない' do
      @user.first_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name katakana can't be blank"
    end
    it 'first_name_katakanaは全角（カタカナ）でなければ登録できない' do
      @user.first_name_katakana = 'あfdgs@'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name katakana 全角カタカナのみで入力して下さい"
    end
    it '生年月日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
 end
end