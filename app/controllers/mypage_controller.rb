class MypageController < ApplicationController
  before_action :authenticate_user!
  def index
    @usrs = User.find(current_user.id)
    @likeds ={}
    @commenteds ={}
    @createds ={}
    unless @usrs.likedclass.blank?
      @likeds = @usrs.likedclass.split('#')
    end
    unless @usrs.commentedid.blank?
      @commenteds = @usrs.commentedid.split('#')
    end
    unless @usrs.createdclass.blank?
      @createds = @usrs.createdclass.split('#')
    end

    @mess = Comment.where(courseid: params[:id])
  end

  def result
    #@products = Product.all
    @q   = Course.search(params[:q])
    @res = @q.result(distinct: true).page(params[:page]).per(50)
    @com = Comment.all


  end
end
