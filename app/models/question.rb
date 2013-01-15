# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  type       :integer
#  points     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer
#

class Question < ActiveRecord::Base
  attr_accessible :content, :points, :title, :type, :course_id
  belongs_to :course

  default_scope order: 'questions.created_at DESC'
end
