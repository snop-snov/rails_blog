FactoryGirl.define do
  factory :comment do
    commenter 'MyString'
    body      'MyText'
    association :post, factory: :post
  end
end