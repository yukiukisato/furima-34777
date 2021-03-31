require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it '姓が空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it '名が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it '姓(カナ)が空では登録できない' do
      @user.last_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name katakana can't be blank"
    end
    it '名(カナ)が空では登録できない' do
      @user.first_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name katakana can't be blank"
    end
    it '生年月日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end