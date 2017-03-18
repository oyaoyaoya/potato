class HomeController < ApplicationController
  before_action :complete_user?, only: :index
  before_action :set_user_faculty, only: :index
  def index
    @items = Item.all
  end

  def show
  end
  private
  def set_user_faculty
    user_f_id = current_user.faculty_id
    users_fac = FacultyAndCourse.where(faculty_id: user_f_id)
    users_fac_id = users_fac.map{|d| d.course_id}
    @user_oriented_course = Course.where(id: users_fac_id)
  end
  def complete_user?
    if current_user.completed == false
      redirect_to edit_user_path(current_user)
    end
  end
end
