class FCircle < ActiveRecord::Base
  attr_accessible :name, :user_id, :friends

  has_many :friend_circle_memberships
  has_many :friends, :through => :friend_circle_memberships
  belongs_to :user
end
