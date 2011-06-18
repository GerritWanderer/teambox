class Project < ActiveRecord::Base
  has_many :messages, :dependent => :delete_all
  has_many :attachments, :dependent => :delete_all
  
  validates :title, :length => {:minimum => 3, :maximum => 254}
end
