class CoursesController < ApplicationController
  before_action :set_course, only: %w( show )

  def index
    if params[:course].present?
      @courses = Course.all
      search_by_name(params[:course][:name]) if params[:course][:name].present?
      search_by_textbook_name(params[:course][:textbook_name])if params[:course][:textbook_name].present?
      search_by_faculty(params[:course][:faculty_id])if params[:course][:faculty_id].present?
      search_by_day(params[:course][:day])if params[:course][:day].present?
      search_by_period(params[:course][:period])if params[:course][:period].present?
      @courses = @courses.includes(:textbooks).page(params[:page]).per(10)
    else
      if params[:faculty_id].present?
        @faculty = Faculty.find(params[:faculty_id])
      else
        @faculty = Faculty.find(rand(1..11))
      end
      @courses = Course.where(faculty_id: @faculty.id, school_id: 1, text_presence: "existed").includes(:textbooks).page(params[:page]).per(10)
    end
  end

  def show
    # @items = Item.where(same_as_course).order(:purchased).group_by{|i| i.textbook_id}
    # @textbooks = Textbook.where(same_as_course)
  end
  def search
    unless search_params[:name] == ""
      c = Course.search_by(search_params[:name])
      if c.count < 15
        @courses = c
      else
        @courses = Course.only_existed.search_by(search_params[:name])
      end
      respond_to do |format|
        format.html
        format.json
      end
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

  def search_by_name(name)
    @courses = @courses.where('name LIKE(?)', "%#{name}%")
  end

  def search_by_textbook_name(textbook_name)
    a = []
    textbooks = Textbook.where('name LIKE(?)', "%#{textbook_name}%")
    if textbooks.present?
        ids = textbooks.map{|textbook| a << textbook.course_id}
        @courses = @courses.where(id: ids)
    end
  end

  def search_by_faculty(faculty_id)
    @courses = @courses.where(faculty_id: faculty_id)
  end

  def search_by_period(period)
    @courses = @courses.where(period: period)
  end

  def search_by_day(day)
    @courses = @courses.where(day: day)
  end

end
