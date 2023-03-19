
class PostsController < ApplicationController

  before_action :authenticate_user! , except: [:show]
  before_action :find_post, only: [:edit,:update,:show,:destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
  end
  
  def update
    if @post.update(post_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  def show
  end

  def destroy
    @post.destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :field_id, files: []).merge(user_id: current_user.id)
  end

  def find_post
    @post = Post.find(params[:id])
  end


end
