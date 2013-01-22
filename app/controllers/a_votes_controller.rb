class AVotesController < ApplicationController
  def create
  	# @vote = Vote.where(params[:vote].slice(:question_id, :answer_id).merge(:user_id => current_user.id)).first
  	@a_vote = AVote.where(:answer_id => params[:a_vote][:answer_id], :user_id => current_user.id).first
	if @a_vote
	  @a_vote.up = params[:a_vote][:up]
	  @a_vote.save
	else
	  @a_vote = current_user.a_votes.create(params[:a_vote])
	end
	redirect_to :back
  end
end
