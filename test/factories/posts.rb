FactoryGirl.define do
  factory :post do
    title
    text
    state 'unpublished'
  end
end