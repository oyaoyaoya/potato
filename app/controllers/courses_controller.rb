class CoursesController < ApplicationController
  before_action :set_course, only: %w( show )

  def index
    # 授業の名前 もしくは、教科書の名前で検索。
    # 最終的には授業一覧を表示
    page_num = (params[:page].presence || 1).to_i
    if params[:textbook_name].present? && params[:course_name].present?
      @courses = Course.joins_t.with_attr.only_existed.search_by_textbook(params[:textbook_name]).search_by_course(params[:course_name])
    elsif params[:textbook_name].present?
      @courses = Course.joins_t.with_attr.only_existed.search_by_textbook(params[:textbook_name])
    elsif params[:course_name].present?
      @courses = Course.with_attr.only_existed.search_by_course(params[:course_name])
    else
      flash[:notice] = "検索ワードを入れてお試しください"
      redirect_to search_path
    end
    @count = @courses.count
    @courses = @courses.page(page_num).per(14)
  end

  def show
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

  def set_course
    @course = Course.find(params[:id])
  end

  def search_params
    params.permit(:name)
  end

end
