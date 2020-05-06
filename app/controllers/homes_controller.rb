class HomesController < ApplicationController
  def index
    @order = Order.order(created_at: :desc).where("firend = #{current_user.id}").last(5)
    @friends_order = Order.select('*').joins('INNER JOIN `friendships` ON `friendships`.`friend_id` = `orders`.`firend` INNER JOIN `users` ON `users`.`id` = `orders`.`firend`').where("friendships.user_id = #{current_user.id}")
    # puts @friends_order
  end
  def create

  end
  def show

  end
  def new

  end
  def edit

  end
  def update

  end
  def destroy

  end
end
