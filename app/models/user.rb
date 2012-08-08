class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
  :first_name, :last_name, :birthday, :country, :avatar

  validates_presence_of :first_name, :last_name, :country

  has_many :assignments
  has_many :roles, through: :assignments

  mount_uploader :avatar, AvatarUploader

  def admin?
    self.roles.map(&:name).include? "admin"
  end

end
