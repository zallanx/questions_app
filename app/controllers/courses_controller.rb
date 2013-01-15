class CoursesController < ApplicationController
  def index
  	@courses = current_school.courses.paginate(page: params[:page])
  end

  def show
  	@course = Course.find(params[:id])
  	@questions = @course.questions.all #change to sections if needed
  end

  def new
  	@course = current_school.courses.new
  end


  def create
  	@course = current_school.courses.build(params[:course])
  	if @course.save
  		#flash message, encourage to populate and invite users(...)
  		redirect_to school_courses_path(current_school) #shows list of course questions
  	else
  		render 'new'
  	end
  end

  def edit
  end
end
