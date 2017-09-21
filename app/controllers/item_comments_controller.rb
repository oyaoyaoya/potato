class ItemCommentsController < ApplicationController
  def create
    if user_signed_in?
      @comment = current_user.item_comments.new(comment_params)
    else
      @comment = ItemComment.new(no_user_comments_params)
    end
    if @comment.save
      respond_to do |format|
        format.html
        format.json
      end
    else
      redirect_to item_path(params[comment][:item_id])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :item_id)
  end

  def no_user_comments_params
    params.require(:comment).permit(:body, :item_id).merge(user_id: 1)
  end
end
