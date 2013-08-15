FactoryGirl.define do
  factory 'post/comment' do
    body
    association :post
    association :user
  end
end
