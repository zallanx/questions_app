# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  content       :text
#  type          :integer
#  points        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  course_id     :integer
#  user_id       :integer
#  answer_status :boolean
#

class Question < ActiveRecord::Base
  attr_accessible :content, :points, :title, :type, :course_id, :answer_status
  
  belongs_to :course
  belongs_to :user
  has_many :votes
  has_many :answers

  default_scope order: 'questions.created_at DESC'
end
