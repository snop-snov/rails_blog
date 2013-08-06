class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  #validates :commenter, presence: true
end
