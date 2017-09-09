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
    page_num = (params[:page].presence || 1).to_i
    @courses = Course.where(hash).includes({textbooks: [:items]}).page(page_num).per(14)
    # binding.pry
  end

  def search
    if params[:key] == "sell"
      @type = "sell"
    elsif
      @type = "buy"
    end
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
