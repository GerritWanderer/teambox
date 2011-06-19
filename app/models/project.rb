class Project < ActiveRecord::Base
  has_many :messages, :dependent => :delete_all
  has_many :attachments, :dependent => :delete_all
  
  validates :title, :length => {:minimum => 3, :maximum => 254}
  
  scope :active, where(:closed => 0)
  scope :closed, where(:closed => 1)
  
  def self.get_visibility_options(controller, action)
    form_actions = ['new', 'edit', 'create']
    show_project_form = controller == 'projects' && form_actions.index(action) ? true : false
    show_projects = controller == 'projects' && action == 'index' ? true : false
    return show_project_form, show_projects
  end
end
