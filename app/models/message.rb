class Message < ActiveRecord::Base
  belongs_to :project
  
  validates_presence_of :project
  validates :title, :length => {:minimum => 3, :maximum => 254}
  validates :body, :length => {:minimum => 3, :maximum => 999}
  validates :task, :length => {:minimum => 3, :maximum => 60}
end
