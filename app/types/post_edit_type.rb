class PostEditType < Post
  include BaseType

  permit :title, :text, :state_event, :activity_state_event, :image

  validates :title, presence: true
  validates :text, presence: true
end