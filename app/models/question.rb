# == Schema Information
#
# Table name: questions
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  content            :text
#  type               :integer
#  points             :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  course_id          :integer
#  user_id            :integer
#  answer_status      :boolean
#  accepted_answer_id :integer
#

class Question < ActiveRecord::Base
  attr_accessible :content, :points, :title, :type, :course_id, :answer_status, :accepted_answer_id

  is_impressionable #to get view counts
  
  belongs_to :course
  belongs_to :user
  has_many :votes
  
  has_many :answers, inverse_of: :question
  belongs_to :accepted_answer, class_name: :answer, foreign_key: :accepted_answer_id

  default_scope order: 'questions.created_at DESC'
end
