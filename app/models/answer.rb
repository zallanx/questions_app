# == Schema Information
#
# Table name: answers
#
#  id                 :integer          not null, primary key
#  question_id        :integer
#  user_id            :integer
#  content            :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  accepted_answer_id :integer
#

class Answer < ActiveRecord::Base
  attr_accessible :content, :question_id, :user_id, :accepted_answer_id

  belongs_to :user
  belongs_to :question, inverse_of: :answers
  has_many :a_votes #change to :votes

  default_scope order: 'answers.created_at DESC'

  def accepted?
  	return false if new_record? 
  	question.try( :accepted_answer_id ) == id
  	# an alternative is to use question.try( :accepted_answer ) == self
  end

end
