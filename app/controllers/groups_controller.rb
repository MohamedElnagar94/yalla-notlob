class GroupsController < ApplicationController
  def index
    @groups = Group.select('*').where(user_id: current_user.id)
    @friends = Friendship.select('*').joins(:friend).where(user_id: current_user.id)
  end

  def create
    # @fact = Fact.new(fact_params)

    @group = Group.new(params[:group].permit(:group_name,:user_id))
    @group.save
    @groups = Group.all
    # respond_to do |format|
    # if @group.save
    #   respond_to do |format|
    #     format.html { redirect_to groups_url }
    #     format.json { head :no_content }
    #     format.js { render :layout => false }
    #   end
    # end
  end

  def show

  end

  def new
    puts 'new'
  end

  def edit
    puts 'edit'
  end

  def update
    puts 'update'
  end

  def destroy
    @group_friends = GroupFriend.select('*').where("group_id = #{params[:id]}")
    @group_friends.each(&:destroy)
    # @group_friends.destroy
    @group = Group.find(params[:id])
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
      format.js { render :layout => false }
    end
  end

end
