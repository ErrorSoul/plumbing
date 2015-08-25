class CommentsController < ApplicationController
  respond_to :json
  
  def send_comment
    
    #pry.binding
    @comment = Comment.new comment_params
    
    if @comment.save
      
      render json: {message: "send", comment: @comment}
    else
      render json: {message: "error"}
    end
  end

  private 

  def comment_params
    params[:comment].permit!
  end

end
