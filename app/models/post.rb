class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  mount_uploader :image, PostImageUploader

  state_machine :state, :initial => :unpublished do
    state :unpublished
    state :published

    event :publish do
      transition :unpublished => :published
    end
    event :unpublish do
      transition :published => :unpublished
    end
  end

  state_machine :activity_state, :initial => :new_post do
    state :new_post
    state :deleted
    state :restored

    event :mark_as_deleted do
      transition :new_post => :deleted
      transition :restored => :deleted
    end
    event :restore do
      transition :deleted => :restored
    end
  end

  include PostRepository
end
