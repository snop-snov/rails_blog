FactoryGirl.define do
  factory :user do
    email
    username
    password

    factory :owner do
      username {configus.owner.username}
    end
  end
end
