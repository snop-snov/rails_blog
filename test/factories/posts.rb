FactoryGirl.define do
  factory :post do
    title
    text
    state 'new'
  end
end