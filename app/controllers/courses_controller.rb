class CoursesController < ApplicationController
  before_action :set_course, only: %w( show )
  def index
    @faculty = current_user.faculty
    @courses = Course.where(faculty_id: @faculty.id, school_id: current_user.school.id)
  end
  def show
    @items = Item.where(same_as_course).order(:purchased).group_by{|i| i.textbook_id}
    @textbooks = Textbook.where(same_as_course)
  end
  def search
    @courses = Course.search_by(search_params[:name])
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def same_as_course
   {course_id: params[:id]}
  end
  def set_course
    @course = Course.find(params[:id])
  end
  def search_params
    params.permit(:name)
  end
end
