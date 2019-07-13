class PostsController < ApplicationController
  before_action :require_logged_in

  def index
    @posts=Post.all.order('updated_at DESC')
  end

  def confirm
    @post=Post.new(post_params)
    @post.user_id=current_user.id
    if @post.invalid?
      render :new
    end
  end

  def show
    @post=Post.find(params[:id])
    @favorite=Favorite.find_by(post_id: @post.id)
  end

  def new
    if params[:back]
      @post=Post.new(post_params)
    else
      @post=Post.new
    end
  end

  def create
    @post=Post.new(post_params)
    @post.user_id=current_user.id
    if @post.save
      flash[:success]='Posted!!'
      redirect_to posts_path
    else
      flash.now[:danger]='Failed..'
      render 'new'
    end
  end

  def edit
    @post=Post.find(params[:id])
  end

  def update
    @post=Post.find(params[:id])
    if @post.update(post_params)
      flash[:success]='Edit completed'
      redirect_to posts_path
    else
      flash[:danger]='Failed..'
      render 'edit'
    end
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    flash[:danger]='Deleted!'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title,:content,:user)
  end
end
