class ApplicationController < ActionController::Base
  protect_from_forgery

  include CoursesHelper
  include QuestionsHelper
  
end
