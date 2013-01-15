module CoursesHelper

  def current_school=(school)
    @current_school = school
  end

  def current_school
    @current_school ||= School.find(params[:school_id])
  end

end
