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

require 'spec_helper'

describe AVote do
  pending "add some examples to (or delete) #{__FILE__}"
end
