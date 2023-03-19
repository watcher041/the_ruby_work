
class Tag < ApplicationRecord

  has_many :posts_tags
  has_many :posts , through: :posts_tags
  validates :name, presence: true
  has_ancestry

  # タグに紐づいているpostがあるかチェックする
  def self.checkEmpty(post)

    # postに紐づくタグを調べる
    tags = post.tags

    # タグごとに紐づいているpostがあるか調べる
    tags.each do |tag|

      # post と tag の紐づけを削除する
      PostsTag.find_by( post_id: post.id , tag_id: tag.id ).delete

      # tag に紐づいている post がなければ削除する
      tag.delete if tag.posts.length == 0

    end
  end

end
