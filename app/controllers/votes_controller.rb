class VotesController < ApplicationController
  def create
  	# @vote = Vote.where(params[:vote].slice(:question_id, :answer_id).merge(:user_id => current_user.id)).first
  	@vote = Vote.where(:question_id => params[:vote][:question_id], :user_id => current_user.id).first
	if @vote
	  @vote.up = params[:vote][:up]
	  @vote.save
	else
	  @vote = current_user.votes.create(params[:vote])
	end
	redirect_to :back
  end
end