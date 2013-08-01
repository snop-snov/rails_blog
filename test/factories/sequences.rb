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
end