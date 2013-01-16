class QuestionsController < ApplicationController
  
  def index
  end

  def show
  end

  def new
    @course = Course.find(params[:course])
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question]) #change to current_user.create
    @course = @question.course
    if @question.save
      redirect_to school_course_path(@course.school, @course)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
