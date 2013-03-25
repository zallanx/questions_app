class RelationshipsController < ApplicationController
  before_filter :signed_in_user

  def create
  	@course = Course.find(params[:relationship][:followed_id])
    current_user.follow!(@course)
    flash[:success] = "You're now following this class!"
    redirect_to school_course_path(@course.school, @course)
  end

  def destroy
  	@course = Relationship.find(params[:id]).followed
    current_user.unfollow!(@course)
    flash[:notice] = "You are no longer following this class."
    redirect_to school_course_path(@course.school, @course)
  end

end
