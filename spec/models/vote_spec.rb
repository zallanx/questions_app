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

require 'spec_helper'

describe Vote do
  pending "add some examples to (or delete) #{__FILE__}"
end
