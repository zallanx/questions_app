# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :a_vote do
    user_id ""
    answer_id ""
    up false
  end
end
