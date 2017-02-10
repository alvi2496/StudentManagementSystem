class SemestersController < ApplicationController
  before_action :ensure_if_admin, :set_semester,
                only: [:show, :edit, :update, :destroy, :show_available_courses]

  # GET /semesters
  # GET /semesters.json
  def index
    ensure_if_signed_in
    ensure_if_admin
    @semesters = Semester.sort_by_position
  end

  # GET /semesters/1
  # GET /semesters/1.json
  def show
    @semester = Semester.find(params[:id])
    @courses = @semester.courses
  end

  # GET /semesters/new
  def new
    @semester = Semester.new
  end

  # GET /semesters/1/edit
  def edit
  end

  # POST /semesters
  # POST /semesters.json
  def create
    @semester = Semester.new(semester_params)

    if @semester.save
      flash[:notice] = "Saved Successfully"
      redirect_to semesters_path
    else
      flash[:notice] = "Semester Creation Unsuccessful"
      render("new")
    end

    # respond_to do |format|
    #   if @semester.save
    #     format.html { redirect_to @semester, notice: 'Semester was successfully created.' }
    #     format.json { render :show, status: :created, location: @semester }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @semester.errors, status: :unprocessable_entity }
    #   end
   # end
  end

  # PATCH/PUT /semesters/1
  # PATCH/PUT /semesters/1.json
  def update
    @semester = Semester.find(params[:id])

    if @semester.update_attributes(semester_params)
      flash[:notice] = "Update Successful"
      redirect_to semester_path(@semester)
    else
      flash[:notice] = "update Unsuccessful"
      render("new")
    end
    # respond_to do |format|
    #   if @semester.update(semester_params)
    #     format.html { redirect_to @semester, notice: 'Semester was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @semester }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @semester.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /semesters/1
  # DELETE /semesters/1.json
  def destroy
    @semester.destroy
    respond_to do |format|
      format.html { redirect_to semesters_url, notice: 'Semester was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_available_courses
    @semester = Semester.find(params[:id])
    @courses = Course.unassigned
  end

  def assign_new_courses
    @semester = Semester.find(params[:id])
    params['semester']['course_ids'].each do |course_id|
      @semester.courses << Course.find(course_id)
      @course = Course.find(course_id)
      @course.change_in_course_state
    end
    redirect_to semester_path(@semester)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_semester
      @semester = Semester.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def semester_params
      params.require(:semester).permit(:name, :position, courses_attributes: [:id])
    end

end
