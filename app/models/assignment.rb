class Assignment < ActiveRecord::Base
  attr_accessible :role_id, :user_id, :kind_of
  belongs_to :user
  belongs_to :role
end
