# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  heading    :string(255)
#  school_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Course < ActiveRecord::Base
  attr_accessible :heading, :name #, :school_id
  belongs_to :school
  has_many :questions

end
