class Vote < ActiveRecord::Base
  attr_accessible :question_id, :up

  belongs_to :user
  belongs_to :question

  validates :user_id, :uniqueness => { :scope => :question_id }
end
