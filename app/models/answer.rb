# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  user_id     :integer
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ActiveRecord::Base
  attr_accessible :content, :question_id, :user_id

  belongs_to :user
  belongs_to :question
  has_many :votes

  default_scope order: 'answers.created_at DESC'

end
