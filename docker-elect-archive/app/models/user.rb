class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts, dependent: :destroy

  has_many :comments, dependent: :destroy
  
  #mount_uploader :image, ImageUploader

  validates :name, presence: true, uniqueness: true
  
end
