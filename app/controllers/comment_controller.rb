class CommentController < ApplicationController
  def index
    authorize! @auth
    @comments = Comment.all
  end

  def show
    authorize! @auth
  end

  def destroy
    authorize! @auth
    @comment = Comment.find(params[:id])


    @usr = User.find(@comment.usersid)
    @usr.commentedid = ("#" + @usr.commentedid).gsub("#"+params[:id].to_s+"#", "#")
    @usr.commentedid.slice!(0)
    @usr.save

    @comment.destroy
    redirect_to('/comment/index')

  end

end
