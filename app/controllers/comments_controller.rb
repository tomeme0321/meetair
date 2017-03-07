class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)
    @post = @comment.post

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post), notice: 'Your comment was posted.' }
        format.json { render :show, status: :created, location: @comment }
        format.js { render :index }
        else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:post_id, :content)
    end
end
