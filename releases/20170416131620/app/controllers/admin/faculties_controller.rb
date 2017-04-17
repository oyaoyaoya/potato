class Admin::FacultiesController < AdminController
  before_action :set_admin_faculty, only: [:show, :edit, :update, :destroy]

  # GET /admin/faculties
  # GET /admin/faculties.json
  def index
    @admin_faculties = Faculty.all
  end

  # GET /admin/faculties/1
  # GET /admin/faculties/1.json
  def show
  end

  # GET /admin/faculties/new
  def new
    @admin_faculty = Faculty.new
  end

  # GET /admin/faculties/1/edit
  def edit
  end

  # POST /admin/faculties
  # POST /admin/faculties.json
  def create
    @admin_faculty = Faculty.new(admin_faculty_params)

    respond_to do |format|
      if @admin_faculty.save
        format.html { redirect_to @admin_faculty, notice: 'Faculty was successfully created.' }
        format.json { render :show, status: :created, location: @admin_faculty }
      else
        format.html { render :new }
        format.json { render json: @admin_faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/faculties/1
  # PATCH/PUT /admin/faculties/1.json
  def update
    respond_to do |format|
      if @admin_faculty.update(admin_faculty_params)
        format.html { redirect_to @admin_faculty, notice: 'Faculty was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_faculty }
      else
        format.html { render :edit }
        format.json { render json: @admin_faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/faculties/1
  # DELETE /admin/faculties/1.json
  def destroy
    @admin_faculty.destroy
    respond_to do |format|
      format.html { redirect_to admin_faculties_url, notice: 'Faculty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_faculty
      @admin_faculty = Faculty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_faculty_params
      params.fetch(:admin_faculty, {})
    end
end
