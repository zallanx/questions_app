class AnswersController < ApplicationController
  before_filter :signed_in_user, only: [:create, :update, :destroy]
  # before_filter :correct_user, only: [:create, :update, :destroy]

  def create
  	@answer = current_user.answers.build(params[:answer])
  	if @answer.save
  		flash[:success] = "Answer posted!"
  		redirect_to question_path(@answer.question)
  	else
  		render question_path(@answer.question)
  	end
  end

  def update
  end

  def destroy
  end

  private

end
