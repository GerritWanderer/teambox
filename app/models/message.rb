class Message < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :messages, :as => :topic
  
  validates_presence_of :project
  validates :title, :length => {:minimum => 3, :maximum => 254}
  validates :body, :length => {:minimum => 3, :maximum => 999}
    
  serialize :readers, Array
  
  
  default_scope order("created_at DESC")
  scope :user_unread, proc {|user_id| where("readers NOT LIKE '%- #{user_id}%'")}
  scope :is_topic, where(:topic_id => nil)
end
