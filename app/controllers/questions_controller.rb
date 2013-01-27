class QuestionsController < ApplicationController

  impressionist :actions=>[:show] #view counter

  before_filter :signed_in_user, only: [:new, :edit, :create, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update, :destroy]


  def index
  end

  def show

    @question = Question.find(params[:id])
    @view_count = @question.impressionist_count
    @course = @question.course
    @user = @question.user
    @answers = @question.answers.all
    @answer = current_user.answers.build

    #-- If a question has been answered by a user, the form does not show up anymore (tbr)

    @list_of_users = [] unless @list_of_users

    @answers.each do |answer|
      @list_of_users.push(answer.user.username)
    end

    if @list_of_users.include?(current_user.username)
      @do_not_show_form = true
    else
      @do_not_show_form = false
    end

    #---------------------------------------------------------------------------------------
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
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
      flash[:success] = "Question updated."
      redirect_to question_path(@question)
    else
      redirect_to question_path(@question)
      render 'edit'
    end
  end

  def destroy
  end

  def accept_answer
    @question = Question.find( params[:id] )
    if @question.update_attributes( accepted_answer_id: params[:answer_id] )
      # ...render the js that updates your view (for example, 
      # find and replace calling link with an "unselect" one )
      flash[:success] = "Answer selected."
      redirect_to question_path(@question)
    else
      # .. an error has occurred, render an "unprocessable entity" status
      flash[:notice] = "No answer selected."
      redirect_to question_path(@question)
    end
  end

  def clear_accepted_answer
    @question = Question.find( params[:id] )
    if @question.update_attributes( accepted_answer_id: nil )
      flash[:notice] = "Answer cleared."
      redirect_to question_path(@question)
    else
      redirect_to question_path(@question)
    end
  end  

  private

  def correct_user
    @question = Question.find(params[:id])
    @user = @question.user
    redirect_to(root_path) unless current_user?(@user)
  end

end
