class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /courses
  # GET /courses.json
  def index
    authorize! @auth
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course.pv +=1
    @course.save
    @usrs = User.find(current_user.id)
    @charts = Rating.find_or_create_by(courseid: params[:id])
    @comments = Comment.new
    @mess = Comment.where(courseid: params[:id])
    unless @usrs.ratedclass.blank?
      @ratedornot = @usrs.ratedclass.split("#").find{ |ids| ids.to_i ==   params[:id].to_i }
    end

    if @usrs.votedcomid.blank?
      @votedornot = []
    else
      @votedornot = @usrs.votedcomid.to_s.split("#")
    end

    unless @usrs.likedclass.blank?
      @likedornot = @usrs.likedclass.split("#").find{ |ids| ids.to_i ==   params[:id].to_i }
    else
      @likedornot ={}
    end

  end

  def rate
    @ratings = Rating.find_or_create_by(courseid: params[:id])
    @ratings.vote +=1
    @ratings.teacher += params[:rating][:teacher].to_i
    @ratings.courserate += params[:rating][:courserate].to_i
    @ratings.easy += params[:rating][:easy].to_i
    @ratings.attendance += params[:rating][:attendance].to_i
    @ratings.homework += params[:rating][:homework].to_i


    @usrs = User.find(current_user.id)
    unless @usrs.ratedclass.blank?
      @ratedornot = @usrs.ratedclass.split("#").find{ |ids| ids.to_i ==   params[:id].to_i }
    end
    @usrs.ratedclass = @usrs.ratedclass.to_s + params[:id]  + '#'

    if @ratedornot.blank? then
      @ratings.save
      @usrs.save
    end
    redirect_to('/courses/'+params[:id].to_s)

  end
  def comm
    unless params[:comment][:message].blank? then
      ccc = Comment.new
      ccc.courseid = params[:id].to_i
      ccc.usersid = current_user.id
      ccc.message = params[:comment][:message]
      ccc.year = params[:comment][:year]
      ccc.typos = params[:comment][:typos]
      ccc.bycommented = Course.find(params[:id]).pv.to_i

      ccc.save


      @usrs = User.find(current_user.id)
      @usrs.commentedclass = @usrs.commentedclass.to_s + params[:id] + '#'
      @usrs.commentedid = @usrs.commentedid.to_s  + Comment.count.to_s + '#'
      @usrs.bycommented = @usrs.bycommented.to_s + Course.find(params[:id]).pv.to_s+ '#'
      @usrs.save


      end
      redirect_to('/courses/'+params[:id].to_s)

  end

  def vote
    vvv = Comment.find(params[:id])
    if params[:gorb] == "g"
      vvv.goods += 1
    else
      vvv.bads += 1
    end
    @usrs = User.find(current_user.id)

    if @usrs.votedclass.blank?
      @votedornot = []
    else
      @votedornot = @usrs.votedcomid.to_s.split("#")
    end

    @usrs.votedcomid = @usrs.votedcomid.to_s + params[:id]  + '#'

    if @votedornot.find{ |ids| ids.to_i ==   params[:id].to_i }.blank?
      vvv.save
      @usrs.save
    end

  end


  def like
    @usrs = User.find(current_user.id)

    unless @usrs.likedclass.blank?
      @likedornot = @usrs.likedclass.split("#").find{ |ids| ids.to_i ==   params[:id].to_i }
    else
      @likedornot ={}
    end

    if @likedornot.blank?
      @usrs.likedclass = @usrs.likedclass.to_s + params[:id]  + '#'
      @usrs.save
    end

  end
  def dislike
    @usrs = User.find(current_user.id)



    @usrs.likedclass = ("#" + @usrs.likedclass).gsub("#"+params[:id].to_s+"#", "#")
    @usrs.likedclass.slice!(0)
    @usrs.save


  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
    authorize! @auth
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @course.creator = current_user.id
    respond_to do |format|
      if @course.save
        @usrs = User.find(current_user.id)
        @usrs.createdclass = @usrs.createdclass.to_s + Course.count.to_s+ '#'
        @usrs.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    authorize! @auth
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    authorize! @auth
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:coursename, :teacher, :credits, :duration, :weekday, :code, :univ, :dept, :creator)
    end
end
