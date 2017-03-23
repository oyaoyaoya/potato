class HomeController < ApplicationController
  before_action :complete_user?, only: :index
  before_action :set_user_faculty, only: :index
  def index
    @textbooks = []
    @items = []
    @courses.each do  |course|
      if course.textbooks.present?
        @textbooks << course.textbooks
        course.textbooks.each do |textbook|
          @items << textbook.items if textbook.items.present?
        end
      else
      end
    end
  end

  def show
  end
  private
  def set_user_faculty
    @courses = Course.where(faculty_id: current_user.faculty_id)
  end
  def complete_user?
    if current_user.completed == false
      redirect_to edit_user_path(current_user)
    end
  end
end
