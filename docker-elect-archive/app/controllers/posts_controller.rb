
class PostsController < ApplicationController

  before_action :find_post, only: [:edit,:update,:destroy]

  def new
    @post = Post.new
  end

  def create

    # 投稿データを変数に格納する
    @post = Post.new(post_params)

    # バイナリデータで画像を保存する
    if  params[:post][:image].present?
        @post.image = params[:post][:image].read
    end

    if @post.save
      flash[:notice] = '投稿が完了しました'
      redirect_to root_path
    else 
      render "new"
    end
  end

  def edit
  end

  def update
    update_params = @post.update_or_delete_tag(post_params)
    if @post.update(update_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy

    # 関連づいているタグがなければ削除
    Tag.checkEmpty(@post)

    # 中間テーブルまでの削除を行う
    if @post.delete
      redirect_to root_path, notice: "削除が完了しました"
    else
      redirect_to root_path, alert: "削除が失敗しました"
    end

  end

   # 検索用
   def search

    # keywordから検索を行う
    result = Post.search(params[:keyword],params[:tag_id])

    # メソッドを使用して作成したデータは配列扱いになるため、kaminari独自のメソッドでpagenateさせる
    @posts = Kaminari.paginate_array(result).page(params[:page]).per(3)

  end

  # バイナリー画像を変換して表示
  def get_image
    tmpbin = Post.find(params[:id])
    send_data(tmpbin.image, :disposition => "inline", :type => "image/png")
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title,:author,:image,:text,tags_attributes: [:name,:_destroy,:id] ).merge(user_id:current_user.id)
  end

end
