FactoryGirl.define do
  factory :comment do
    commenter
    body
    association :post
    association :user
  end
end