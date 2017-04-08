class HomeController < ApplicationController
  before_action :complete_user?, only: :index
  def index
    hash = {}
    if user_signed_in?
      @faculty = current_user.faculty
      hash[:faculty_id] = @faculty.id
    else
      @faculty = Faculty.find(rand(1..11))
      hash[:faculty_id] = @faculty.id
    end
    @courses = Course.only_existed.where(hash).includes({textbooks: [:items]}).page(params[:page]).per(14)
  end

  def search
  end

  def help
  end

  def show
  end
  private
  def complete_user?
    if user_signed_in? && current_user.completed == false
      redirect_to edit_user_path(current_user)
    end
  end
end
