class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                      length: { minimum: 5 }
  #validates_presence_of :state

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
end