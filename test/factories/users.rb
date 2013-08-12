FactoryGirl.define do
  factory :user do
    username "user"
    password

    factory :owner do
      username "admin"
    end
  end
end