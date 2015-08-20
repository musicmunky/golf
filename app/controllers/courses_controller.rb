class CoursesController < ApplicationController
	before_action :set_course, only: [:show, :edit, :update, :destroy]

	# GET /courses
	# GET /courses.json
	def index
		@courses = Course.all
	end

	# GET /courses/1
	# GET /courses/1.json
	def show
	end

	# GET /courses/new
	def new
		@course = Course.new
	end

	# GET /courses/1/edit
	def edit
	end


	def getCourseHoleInfo

		cid = params[:course_id]

		response = {}
		content  = {}
		status   = ""
		message  = ""

		begin
			@course = Course.find(cid)
			course_holes = @course.course_holes.order(:hole_number)

			content['course_name']  = @course.name
			content['course_id']    = @course.id
			content['course_holes'] = []
			c = 0
			course_holes.each do |ch|
				content['course_holes'].push(ch.attributes)
				c = c + 1
			end

			response['status'] = "success"
			response['message'] = "Returning information on #{c} holes for #{@course.name}"
			response['content'] = content
		rescue => error
			response['status'] = "failure"
			response['message'] = "Error: #{error.message}"
			response['content'] = error.backtrace
		ensure
			respond_to do |format|
				format.html { render :json => response.to_json }
			end
		end

	end


	def setCourseHoleInfo

		cid = params[:course_id]

		response = {}
		content  = {}
		status   = ""
		message  = ""

		begin
			@course = Course.find(cid)
			course_holes = @course.course_holes.order(:hole_number)

			response['status'] = "success"
			response['message'] = "Updated information on #{c} holes for #{@course.name}"
			response['content'] = content
		rescue => error
			response['status'] = "failure"
			response['message'] = "Error: #{error.message}"
			response['content'] = error.backtrace
		ensure
			respond_to do |format|
				format.html { render :json => response.to_json }
			end
		end

	end

	# POST /courses
	# POST /courses.json
	def create
		@course = Course.new(course_params)

		#logger.debug "\n\n\n\n\n\n\nCOURSE NAME IS: #{course_params['name']}\n\n\n\n\n\n\n"
		respond_to do |format|
			if @course.save
				format.html { redirect_to @course, notice: 'Course was successfully created.' }
				format.json { render :show, status: :created, location: @course }
			else
				format.html { render :new }
				format.json { render json: @course.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /courses/1
	# PATCH/PUT /courses/1.json
	def update
		respond_to do |format|
			if @course.update(course_params)
				format.html { redirect_to @course, notice: 'Course was successfully updated.' }
				format.json { render :show, status: :ok, location: @course }
			else
				format.html { render :edit }
				format.json { render json: @course.errors, status: :unprocessable_entity }
			end
		end
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

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_course
		@course = Course.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def course_params
		params.require(:course).permit(:name, :address1, :address2, :address3, :city, :state, :zip, :course_type_id, :website)
	end
end
