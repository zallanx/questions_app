class QuestionsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :edit, :create, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update, :destroy]


  def index
  end

  def show
    @question = Question.find(params[:id])
    @course = @question.course
    @user = @question.user
    @answers = @question.answers.all
    @answer = current_user.answers.build

  end

  def new
    @course = Course.find(params[:course])
    @question = current_user.questions.new
  end

  def create
    @question = current_user.questions.create(params[:question]) #change to current_user.create
    @course = @question.course
    if @question.save
      #@question.answered = [] 
      redirect_to school_course_path(@course.school, @course)
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
      flash[:success] = "Question updated."
      redirect_to question_path(@question)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def correct_user
    @question = Question.find(params[:id])
    @user = @question.user
    redirect_to(root_path) unless current_user?(@user)
  end

end
