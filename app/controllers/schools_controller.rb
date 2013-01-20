class SchoolsController < ApplicationController
  def index
  	@schools = School.all
  end

  def show
  	@school = School.find(params[:id])
  	@courses = @school.courses.all
  end

  def new
  	@school = School.new
  end

  def create
  	@school = School.new(params[:school])
  	if @school.save
  		#school cookie storage
  		#flash message
  		redirect_to school_courses_path(@school) #current_school?
  	else
  		render 'new'
  	end
  end

  def edit
  end
end
