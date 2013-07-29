class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                      length: { minimum: 5 }

  state_machine :state, :initial => :new do
    state :new
    state :viewed

    event :view do
      transition :new => :viewed
    end
    event :unmark do
      transition :viewed => :new
    end    
  end
end
