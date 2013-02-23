class RelationshipsController < ApplicationController
  before_filter :signed_in_user

  def create
  	@course = Course.find(params[:relationship][:followed_id])
    current_user.follow!(@course)
    redirect_to school_course_path(@course.school, @course)
  end

  def destroy
  	@course = Relationship.find(params[:id]).followed
    current_user.unfollow!(@course)
    redirect_to school_course_path(@course.school, @course)
  end

end
