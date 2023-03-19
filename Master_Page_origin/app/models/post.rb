
class Post < ApplicationRecord

  has_many_attached :files
  belongs_to :field
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :text
    validates :field_id
  end

  def self.search(keyword)
    return Post.all unless keyword
    Post.where("title LIKE(?)","%#{keyword}%")
  end

end
