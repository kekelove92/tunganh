class CoursesController < ApplicationController
  def index
		@courses = Course.all
		respond_to do |format|
			format.html
			format.json{
				render json: { courses: @courses}
			}
		end	
	end

	def enroll
		@course_student = CourseStudent.create(student_id: @current_account.id, course_id: params[:id])


		respond_to do | format|
			format.html
			format.js
			format.json {render json: "plz enter payment method! ", status: 400  }
		end
		
	end
end