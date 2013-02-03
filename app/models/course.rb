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
  belongs_to :school
  has_many :questions
  
  scope :by_questions_count, :order => "questions_count DESC" #works!

 

end
