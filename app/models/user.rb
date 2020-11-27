class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :last_name, presence: true,format:{ with: /\A[ぁ-んァ-ン一-龥]/}
         validates :first_name, presence: true,format:{ with: /\A[ぁ-んァ-ン一-龥]/}
         validates :last_name_kana, presence: true,format:{ with: /\A[ァ-ヶー－]+\z/}
         validates :first_name_kana, presence: true,format:{ with: /\A[ァ-ヶー－]+\z/,message: "6文字以上の半角英数字で記入してください"}
         validates :birthday, presence: true
         validates :name, presence: true
         validates :email, presence: true
         validates :password, presence: true, length: { minimum: 6},format:{ with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
end
