# == Schema Information
#
# Table name: a_votes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  answer_id  :integer
#  up         :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AVote < ActiveRecord::Base #make this into a polymorphic association as part of the Vote model
  attr_accessible :answer_id, :up

  belongs_to :user
  belongs_to :answer

  validates :user_id, :uniqueness => { :scope => :answer_id }
end
