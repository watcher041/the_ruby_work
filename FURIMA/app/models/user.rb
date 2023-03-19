
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address

  # バリデーション関連
  with_options presence: true do

    validates :nickname
    validates :birthday
    validates :email,    uniqueness: {case_sensitive: false},
                         format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "はフォーマットが不適切です"}
    validates :password, length: {minimum: 6},
                         format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}+\z/i, message: "は半角英数字で入力してください"}
 
    with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "は全角で入力してください"} do
      validates :first_name
      validates :last_name
    end
 
    with_options format: {with: /\A[\p{Hiragana}]+\z/, message: "は全角ひらがなで入力してください"} do
      validates :first_kana
      validates :last_kana
    end

  end
  
  has_one  :address, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_items, through: :likes, source: :item
  has_many :evaluates, dependent: :destroy
  has_many :evaluate_items, through: :evaluates, source: :item

end
