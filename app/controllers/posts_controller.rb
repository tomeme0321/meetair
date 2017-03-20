class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def new
    if params[:back]
     @post = Post.new(posts_params)
   else
     @post = Post.new
   end
  end

  def create
    @post = Post.new(posts_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path, notice: "Posted;)"
      NoticeMailer.sendmail_post(@post).deliver
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(posts_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "Deleted:("
  end

  def confirm
    @post = Post.new(posts_params)
    render :new if @post.invalid?
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
    @comments = @post.comments
    Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
  end

  private
  def posts_params
    params.require(:post).permit(:airport, :terminal, :location, :purpose, :company, :destination, :flightdate, :flighttime, :latestcomment)
  end
end
