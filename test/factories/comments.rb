FactoryGirl.define do
  factory :comment do
    commenter
    body
    association :post
  end
end