class CommentsController < ApplicationController

  # 質問投稿用
  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:notice] = 'メッセージが送信されました'
      redirect_to root_path 
    else
      redirect_to root_path, alert: "ERROR! メッセージが送信できませんでした"
    end
  end

  # 質問掲示板
  def index
    @comments = Comment.where(answer:nil).order("created_at DESC")
  end

  # 質問への回答
  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(answer_params)
      flash[:notice] = 'メッセージが送信されました'
      redirect_to root_path
    else
      render "edit" 
    end
  end

  private
  def comment_params
    params.permit(:name,:text)
  end

  def answer_params
    params.require(:comment).permit(:answer).merge(user_id:current_user.id)
  end

end
