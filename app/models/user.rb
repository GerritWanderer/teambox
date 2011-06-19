class User < ActiveRecord::Base
  has_and_belongs_to_many :projects
  has_many :messages
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstname, :lastname, :email, :password, :password_confirmation, :remember_me
  
  def to_s
    "#{self.firstname} #{self.lastname}"
  end
end
