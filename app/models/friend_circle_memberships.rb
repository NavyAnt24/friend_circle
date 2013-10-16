class FriendCircleMemberships < ActiveRecord::Base
  attr_accessible :f_circle_id, :friend_id

  belongs_to :f_circle
  belongs_to  :friend,
              :primary_key => :id,
              :foreign_key => :friend_id
              :class => 'User'

end