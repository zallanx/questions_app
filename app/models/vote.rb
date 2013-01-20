# == Schema Information
#
# Table name: votes
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  question_id :integer
#  up          :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  answer_id   :integer
#

class Vote < ActiveRecord::Base
  attr_accessible :question_id, :answer_id, :up

  belongs_to :user
  belongs_to :question
  belongs_to :answer 

  validates :user_id, :uniqueness => { :scope => :question_id }
end
