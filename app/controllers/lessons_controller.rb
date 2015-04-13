class LessonsController < ApplicationController
  before_action :authenticate_user!, except: :show

  def index
    @lesson = Lesson.find(params[:id])
  end

  def new
    @course = Course.find(params[:course_id])
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @course = Course.find(params[:course_id])
    @lesson.course = @course

    if @lesson.save
      flash[:notice] = "lesson submitted."
      redirect_to course_path(@course)
    else
      flash[:notice] = "failed to submit"
      render :new
    end
  end

  def edit
    @lesson = user_lesson
  end

  def update
    @lesson = user_lesson
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
    @lesson = user_lesson
    @course = @lesson.course
    @lesson.destroy

    unless @course.id.nil?
      @course.update_average
      redirect_to course_path(@course)
    end
  end
  def lesson_params
    params.require(:lesson).permit(:title, :body, :outside_links, :photo)
  end
end
