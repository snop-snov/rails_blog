class PostEditType < Post
  include BaseType

  permit :title, :text, :state_event, :activity_state_event, :image, comments_attributes: [:id, :body, :parent_id]

  validates :title, presence: true
  validates :text, presence: true
end
