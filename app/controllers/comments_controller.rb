class CommentsController < ApplicationController

  private  

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end
end
