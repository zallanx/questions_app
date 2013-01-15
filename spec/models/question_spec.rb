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

require 'spec_helper'

describe Question do
  pending "add some examples to (or delete) #{__FILE__}"
end
