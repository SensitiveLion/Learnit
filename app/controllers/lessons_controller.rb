class LessonsController < ApplicationController
  before_action :authenticate_user!

  def new
    @course = Course.find(params[:course_id])
    @lesson = Lesson.new
  end

  def show
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.find(params[:id])
    @name = @course.name + ", " + @lesson.title
    @google = Search.google(@name)
    @bing = Search.bing(@name)
    @yahoo = Search.yahoo(@name)
    @ask = Search.ask(@name)
    @aol = Search.aol(@name)
    @wow = Search.wow(@name)
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @course = Course.find(params[:course_id])
    @lesson.course = @course
    @lesson.user = current_user

    if @lesson.save
      flash[:notice] = "lesson submitted."
      redirect_to course_path(@course)
    else
      flash[:notice] = "failed to submit"
      render :new
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @course = @lesson.course
    if @lesson.update(lesson_params)
      flash[:notice] = "you have successfully edited the lesson!"
      redirect_to course_path(@course)
    else
      flash[:notice] = "failed to update lesson"
      render :edit
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @course = @lesson.course
    @lesson.destroy

    unless @course.id.nil?
      redirect_to course_path(@course)
    end
  end
  def lesson_params
    params.require(:lesson).permit(:title, :body)
  end
end
