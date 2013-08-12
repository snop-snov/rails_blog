FactoryGirl.define do
  factory :user do
    username "user"
    password
  end

  factory :owner, class: User do
    username "admin"
    password
  end
end