class Admin::TextbooksController < AdminController
  before_action :set_admin_textbook, only: [:show, :edit, :update, :destroy]

  # GET /admin/textbooks
  # GET /admin/textbooks.json
  def index
    page_num = (params[:page].presence || 1).to_i
    @admin_textbooks = Textbook.all.page(page_num).per(50)
  end

  # GET /admin/textbooks/1
  # GET /admin/textbooks/1.json
  def show
  end

  # GET /admin/textbooks/new
  def new
    @admin_textbook = Textbook.new
  end

  # GET /admin/textbooks/1/edit
  def edit
  end

  # POST /admin/textbooks
  # POST /admin/textbooks.json
  def create
    @admin_textbook = Textbook.new(admin_textbook_params)

    respond_to do |format|
      if @admin_textbook.save
        format.html { redirect_to @admin_textbook, notice: 'Textbook was successfully created.' }
        format.json { render :show, status: :created, location: @admin_textbook }
      else
        format.html { render :new }
        format.json { render json: @admin_textbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/textbooks/1
  # PATCH/PUT /admin/textbooks/1.json
  def update
    respond_to do |format|
      if @admin_textbook.update(admin_textbook_params)
        format.html { redirect_to @admin_textbook, notice: 'Textbook was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_textbook }
      else
        format.html { render :edit }
        format.json { render json: @admin_textbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/textbooks/1
  # DELETE /admin/textbooks/1.json
  def destroy
    @admin_textbook.destroy
    respond_to do |format|
      format.html { redirect_to admin_textbooks_url, notice: 'Textbook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_textbook
      @admin_textbook = Textbook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_textbook_params
      params.fetch(:admin_textbook, {})
    end
end
