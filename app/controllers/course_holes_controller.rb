class CourseHolesController < ApplicationController
  before_action :set_course_hole, only: [:show, :edit, :update, :destroy]

  # GET /course_holes
  # GET /course_holes.json
  def index
    @course_holes = CourseHole.all
  end

  # GET /course_holes/1
  # GET /course_holes/1.json
  def show
  end

  # GET /course_holes/new
  def new
    @course_hole = CourseHole.new
  end

  # GET /course_holes/1/edit
  def edit
  end

  # POST /course_holes
  # POST /course_holes.json
  def create
    @course_hole = CourseHole.new(course_hole_params)

    respond_to do |format|
      if @course_hole.save
        format.html { redirect_to @course_hole, notice: 'Course hole was successfully created.' }
        format.json { render :show, status: :created, location: @course_hole }
      else
        format.html { render :new }
        format.json { render json: @course_hole.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_holes/1
  # PATCH/PUT /course_holes/1.json
  def update
    respond_to do |format|
      if @course_hole.update(course_hole_params)
        format.html { redirect_to @course_hole, notice: 'Course hole was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_hole }
      else
        format.html { render :edit }
        format.json { render json: @course_hole.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_holes/1
  # DELETE /course_holes/1.json
  def destroy
    @course_hole.destroy
    respond_to do |format|
      format.html { redirect_to course_holes_url, notice: 'Course hole was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_hole
      @course_hole = CourseHole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_hole_params
      params.require(:course_hole).permit(:hole_number, :black_length, :blue_length, :white_length, :red_length, :green_length, :senior_length, :par, :course_id)
    end
end
