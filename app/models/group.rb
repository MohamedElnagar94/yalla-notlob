class Group < ApplicationRecord
    belongs_to :user
    has_many :group_friends, class_name: "GroupFriend"
end
