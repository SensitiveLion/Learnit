class CoursesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @course = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @lessons = @course.lessons.order(:created_at)
    @save = Save.new
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
    if @course.save
      flash[:notice] = "you have added a new course!"
      redirect_to new_course_lesson_path(@course)
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      flash[:notice] = "you have successfully edited the course!"
      redirect_to @course
    else
      flash[:notice] = "failed to update course"
      render :edit
    end
  end

  def destroy
    if current_user.has_authority?
      @course = Course.find(params[:id])
    else
      @course = Course.find_by!(user: current_user, id: params[:id])
    end
    @course.destroy
    flash[:notice] = 'course deleted.'
    redirect_to root_path
  end

  def course_params
    params.require(:course).permit(:name, :description)
  end
end
