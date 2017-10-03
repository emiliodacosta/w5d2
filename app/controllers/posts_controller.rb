class PostsController < ApplicationController

  before_action :redirect_unless_author, only: [:edit, :update]

  before_action :redirect_unless_author_or_mod, only: :destroy

  def new
    @post = Post.new
    @sub_id = params[:sub_id]
  end

  def create
    @post = Post.new(post_params)
    @post.sub_id = params[:sub_id]
    if @post.save
      redirect_to sub_url(@post.sub_id)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @sub = @post.sub
    if @post.update(post_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @sub = @post.sub
    @post.destroy
    redirect_to sub_url(@sub)
  end

  def show
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end

  def redirect_unless_author
    @post = Post.find(params[:id])
    if @post.author != current_user
      redirect_to sub_url(@post.sub)
      flash[:errors] = ["Hey you can't do that, man."]
    end
  end

  def redirect_unless_author_or_mod
    @post = Post.find(params[:id])
    unless @post.author == current_user || @post.sub.moderator == current_user
      redirect_to sub_url(@post.sub)
      flash[:errors] = ["Hey you can't do that, man."]
    end
  end
end
