class CoursesController < ApplicationController
  def index
  	@courses = current_school.courses.paginate(page: params[:page])
  end

  def show
  	#just showing one course.  Need?
  	@course = current_school.courses.find(params[:id])
  end

  def new
  	@course = current_school.courses.build(params[:course])
  	if @course.save
  		#flash message, encourage to populate and invite users(...)
  		redirect_to @course #shows list of course questions
  	else
  		render 'new'
  	end
  end

  def edit
  end
end
