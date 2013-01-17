# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    user_id 1
    question_id 1
    up false
  end
end
