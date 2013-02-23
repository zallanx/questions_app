# == Schema Information
#
# Table name: courses
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  heading         :string(255)
#  school_id       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  questions_count :integer          default(0)
#

class Course < ActiveRecord::Base
  attr_accessible :heading, :name, :questions_count 

  before_save { |course| course.heading = heading.upcase }

  belongs_to :school
  has_many :questions

  has_many :relationships, foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :relationships, source: :follower
  
  scope :popular, :order => "questions_count DESC" #works!
  scope :by_heading, order: "LOWER(heading) ASC, LOWER(name) ASC" #default sort
  scope :by_creation, order: "created_at DESC"




  scope :most_answered, joins(:questions).order('qyayuestions.answers_count DESC')
  .select("courses.id, courses.name, courses.heading, courses.school_id, courses.created_at, courses.updated_at, courses.questions_count, SUM(questions.answers_count) as answers_count")
  .group("courses.id, courses.name, courses.heading, courses.school_id, courses.created_at, courses.updated_at, courses.questions_count")
  .order("answers_count DESC")

  scope :latest_activity, joins(:questions).order('questions.created_at DESC')
  .select("courses.id, courses.name, courses.heading, courses.school_id, courses.created_at, courses.updated_at, courses.questions_count, SUM(questions.created_at) as created_at")
  .group("courses.id, courses.name, courses.heading, courses.school_id, courses.created_at, courses.updated_at, courses.questions_count")
  .order("created_at DESC, name")



end
