class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
         validates :nickname
         validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
         validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
         validates :last_name_katakana, format: {
          with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/,
          message: "全角カタカナのみで入力して下さい"
        }
         validates :first_name_katakana, format: {
          with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/,
          message: "全角カタカナのみで入力して下さい"
        }
         validates :birthday
        end

         validates :password, :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/ }
        

         has_many :items
         has_many :histries
         
end
