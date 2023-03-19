
class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  belongs_to :user
  belongs_to :category
  belongs_to :brand, optional: true

  enum pay_side: [:seller, :buyer]
  enum status: [:brand_new, :like_new, :invisible_dirt, :a_little_dirt, :dirt_condition, :bad_condition]
  enum situation: [:exhibition, :transaction, :purchase], _prefix: true

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :detail, length: { maximum: 1000 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10000000 }
    validates :pay_side
    validates :status
    validates :prefecture_id, numericality: { greater_than: 0 }
    validates :category_id, numericality: { greater_than: 0 }
    validates :situation
    validates :images
  end

  validates :brand_id, numericality: { greater_than: 0 }, allow_blank: true

  is_impressionable counter_cache: true

end
