class CoursesController < ApplicationController #needs an EXAM DATE
  def index #showing all courses
  	# @courses = current_school.courses.all
    @courses = current_school.courses.all


  end

  def show #showing a course's questions
  	@course = Course.find(params[:id])
    if params[:order]
      sorting_order = params[:order]
  	 @questions = @course.questions.send(sorting_order) #you CAN use scope methods in the child model!
    else
      @questions = @course.questions.by_creation_time #default
    end
  end

  def new
  	@course = current_school.courses.new
  end


  def create
  	@course = current_school.courses.build(params[:course])
  	if @course.save
  		#flash message, encourage to populate and invite users(...)
  		redirect_to school_course_path(current_school, @course) #shows list of course questions
  	else
  		render 'new'
  	end
  end

  def edit
  end
end
