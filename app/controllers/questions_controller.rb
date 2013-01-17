class QuestionsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :destroy]
  before_filter :correct_user, only: :destroy


  def index
  end

  def show
  end

  def new
    @course = Course.find(params[:course])
    @question = current_user.questions.new
  end

  def create
    @question = current_user.questions.create(params[:question]) #change to current_user.create
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
