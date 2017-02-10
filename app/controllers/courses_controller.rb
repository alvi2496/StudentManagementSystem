class CoursesController < ApplicationController
  before_action :ensure_if_admin, :set_course,
                only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    ensure_if_admin
    @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show

  end

  # GET /courses/new
  def new
    @course = Course.new
    @submit = "Create"
    @header = "New Course"
  end

  # GET /courses/1/edit
  def edit
    @submit = "Update"
    @header = "Update Course"
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:notice] = "Course created successfully"
      redirect_to(courses_path)
    else
      flash[:notice] = "Course creation unsuccessful"
      render("new")
    end
    # respond_to do |format|
    #   if @course.save
    #     format.html { redirect_to @course, notice: 'Course was successfully created.' }
    #     format.json { render :show, status: :created, location: @course }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @course.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      flash[:notice] = "Course updated successfully"
      redirect_to courses_path
    else
      flash[:notice] = "Update unseccessful"
      render("edit")
    end
    # respond_to do |format|
    #   if @course.update(course_params)
    #     format.html { redirect_to @course, notice: 'Course was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @course }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @course.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def unassign
    @course = Course.find(params[:id])
    @semester = @course.semester
    @course.remove_semester_association
    redirect_to semester_path(@semester)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:course_code, :course_name, :course_credit, :is_assigned)
    end
end
