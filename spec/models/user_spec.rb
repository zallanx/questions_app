# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  username           :string(255)
#  email              :string(255)
#  password_digest    :string(255)
#  admin              :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  remember_token     :string(255)
#  answered_questions :integer
#

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
