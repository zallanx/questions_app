class AnswersController < ApplicationController
  before_filter :signed_in_user, only: [:create, :update, :destroy]
  before_filter :correct_user, only: [:destroy]

  def create
  	@answer = current_user.answers.build(params[:answer])
  	if @answer.save
  		flash[:success] = "Answer posted!"
  		redirect_to question_path(@answer.question)
  	else
  		render question_path(@answer.question)
  	end
  end

  def edit
    @answer = Answer.find(params[:id])

  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(params[:answer])
      flash[:success] = "Answer updated."
      redirect_to question_path(@answer.question)
    else
      redirect_to question_path(@answer.question)
      render 'edit'
    end    
  end

  def destroy
    @answer.destroy
    redirect_to question_path(@answer.question)
  end

  private

    def correct_user
      @answer = Answer.find(params[:id])
      @user = @answer.user
      redirect_to(root_path) unless current_user?(@user)
    end

end
