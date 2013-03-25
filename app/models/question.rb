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
#  answers_count      :integer          default(0)
#

class Question < ActiveRecord::Base
  attr_accessible :content, :points, :title, :type, :course_id, :answer_status, :accepted_answer_id

  is_impressionable #to get view counts
  validates :title, presence: true, length: { minimum: 10 }, uniqueness: { case_sensitive: false }
  
  belongs_to :course, :counter_cache => true
  belongs_to :user
  has_many :votes
  
  has_many :answers, inverse_of: :question
  belongs_to :accepted_answer, class_name: :answer, foreign_key: :accepted_answer_id

  scope :latest, order: 'questions.created_at DESC'
  scope :latest5, order: 'questions.created_at DESC', limit: 5

  scope :most_active, order: "answers_count DESC, questions.created_at DESC" #add views to order as well

  scope :unanswered, order: "answers_count ASC"
 

end
