FactoryGirl.define do
  factory :user do
    username "user"
    password

    factory :owner do
      username {configus.owner.username}
    end
  end
end
