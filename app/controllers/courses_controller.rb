class CoursesController < ApplicationController #needs an EXAM DATE
  def index
  	# @courses = current_school.courses.all
    @courses = current_school.courses.by_questions_count    # find(:all, :order => "questions_count DESC")


  end

  def show #not using!
  	@course = Course.find(params[:id])
  	@questions = @course.questions.all #change to sections if needed
    redirect_to school_courses(current_school)
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
