class GroupFriend < ApplicationRecord
    belongs_to :group
    # belongs_to :friend, class_name: "User"
    belongs_to :friendship, class_name: "Friendship"
    # has_many :friendships
end
