class GroupFriendsController < ApplicationController
  def index; end

  def destroy
    @delete_friend = GroupFriend.find(params[:id])
    @delete_friend.destroy
  end

  def show
    @user_group = Group.find(params[:id])
    @friends = Friendship.select('*').joins(:friend).where(user_id: current_user.id)
    @friends_of_group = Friendship.select('user_id,friend_id,group_id,friendship_id,email,name,group_friends.id').joins('INNER JOIN `group_friends` ON `group_friends`.`friendship_id` = `friendships`.`id` INNER JOIN `users` ON `users`.`id` = `friendships`.`friend_id`').where("group_friends.group_id = #{params[:id]} AND friendships.user_id = #{current_user.id}")
  end

  def new; end

  def edit; end

  def update; end

  def create
    @check_multiple = GroupFriend.select('*').where(friendship_id: params[:friends][:friendship_id], group_id: params[:friends][:group_id])
    if @check_multiple.size.zero?
      @friend_select = GroupFriend.new(params.require(:friends).permit(:group_id, :friendship_id))
      @friend_select.save
    end
    @friends_of_group = Friendship.select('user_id,friend_id,group_id,friendship_id,email,name,group_friends.id').joins('INNER JOIN `group_friends` ON `group_friends`.`friendship_id` = `friendships`.`id` INNER JOIN `users` ON `users`.`id` = `friendships`.`friend_id`').where("group_friends.group_id = #{params[:friends][:group_id]} AND friendships.user_id = #{current_user.id}")
  end
end
