class Attachment < ActiveRecord::Base
  belongs_to :project

  has_attached_file :file
  validates_presence_of :project
  
  serialize :readers, Array
end
