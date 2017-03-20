class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)
    @post = @comment.post
    @notification = @comment.notifications.build(user_id: @post.user.id )

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post), notice: 'Your comment was posted.' }
        format.json { render :show, status: :created, location: @comment }
        format.js { render :index }
        unless @comment.post.user_id == current_user.id
        Pusher.trigger("user_#{@comment.post.user_id}_channel", 'comment_created', {
           message: 'You got a comment on your post!'
          })
        end
          Pusher.trigger("user_#{@comment.post.user_id}_channel", 'notification_created', {
          unread_counts: Notification.where(user_id: @comment.post.user.id, read: false).count
        })
        else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end

  private
    def comment_params
      params.require(:comment).permit(:post_id, :content)
    end
end
