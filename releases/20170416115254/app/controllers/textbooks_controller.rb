class TextbooksController < ApplicationController
  before_action :authenticate_user!, except: %w( show index )
  before_action :check_text_status,  only: :show

  # GET /textbooks/1
  # GET /textbooks/1.json

  # GET /textbooks/new
  def new
    @textbook = Textbook.new
    @textbook.course_id = params[:course_id].to_i
  end

  # POST /textbooks
  # POST /textbooks.json
  def create
    @textbook = Textbook.new(textbook_params)

    respond_to do |format|
      if @textbook.save
        course = Course.find(@textbook.course_id)
        course.update(text_presence: "existed")
        format.html { redirect_to new_textbook_item_path(@textbook), notice: 'Textbook was successfully created.' }
        format.json { render :show, status: :created, location: @textbook }
      else
        format.html { render :new }
        format.json { render json: @textbook.errors, status: :unprocessable_entity }
      end
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def textbook_params
      params.require(:textbook).permit(:name, :course_id)
    end

    def check_text_status
      if @textbook.textbook_status == "closed"
        refirect_to course_path(@textbook.cource_id), alert: "公開されていない教科書です。"
      else
      end
    end
end
