FactoryGirl.define do
  factory :comment do
    commenter
    body
    association :post, factory: :post
  end
end