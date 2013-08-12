FactoryGirl.define do
  sequence :title do |n|
    "Title #{n}"
  end

  sequence :text do |n|
    "Text #{n}"
  end

  sequence :commenter do |n|
    "Commenter #{n}"
  end

  sequence :body do |n|
    "Comment #{n}"
  end

  sequence :username do |n|
     "User #{n}"
  end

  sequence :password do |n|
    "passwd #{n}"
  end
end