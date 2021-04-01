require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
    # トップページに移動する
    visit root_path
    # トップページにサインアップページへ遷移するボタンがあることを確認する
    expect(page).to have_content('新規登録')
    # 新規登録ページへ移動する
    visit new_user_registration_path
    # ユーザー情報を入力する
    fill_in 'user[nickname]', with: @user.nickname
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    fill_in 'user[password_confirmation]', with: @user.password_confirmation
    fill_in 'user[last_name]', with: @user.last_name
    fill_in 'user[first_name]', with: @user.first_name
    fill_in 'user[last_name_kana]', with: @user.last_name_katakana
    fill_in 'user[first_name_kana]', with: @user.first_name_katakana
    fill_in 'user[birth_date(1i)]', with: @user.birthday
    fill_in 'user[birth_date(2i)]', with: @user.birthday
    fill_in 'user[birth_date(3i)]', with: @user.birthday
    # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { User.count }.by(1)
    # トップページへ遷移したことを確認する
    expect(current_path).to eq(root_path)
    # カーソルを合わせるとログアウトボタンが表示されることを確認する
    expect(
      find('.user_nav').find('span').hover
    ).to have_content('ログアウト')
    # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
    expect(page).to have_no_content('新規登録')
    expect(page).to have_no_content('ログイン')
  end
end
