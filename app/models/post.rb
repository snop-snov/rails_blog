class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                      length: { minimum: 5 }

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

  state_machine :activity_state, :initial => :new do
    state :new
    state :deleted
    state :restored

    event :mark_as_deleted do
      transition :new => :deleted
      transition :restored => :deleted
    end
    event :restore do
      transition :deleted => :restored
    end
  end
end