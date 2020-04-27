class OrdersController < ApplicationController

    def index
        @orders = Order.all
    end
    
    def create
        @order = Order.new #(order_params.except[order_friends:[], order_groups:[]])
        @order.order_for = order_params['order_for']
        @order.resturant_name = order_params['resturant_name']
        @order.picture = order_params['picture']
        @order.firend = current_user.id
        @order.status = "Open"
        
        if @order.save
            # invite friends and groups
            if order_params['order_groups']
              order_params['order_groups'].each do |gorder|
                # get friends from the group
                @gfriends = GroupFriend.where(group_id: gorder)
                @gfriends.each do |gf|
                  order_params['order_friends'].push(gf.id)
                end
              end
            end 

            if order_params['order_friends']
              order_params['order_friends'].each do |forder|
                @friends = OrderUser.new
                @friends.order_id = @order.id
                @friends.user_id = forder
                @friends.notify = 0
                @friends.save
              end
            end 
          
            redirect_to orders_path
        else
            render 'new'
        end
    end

    def show
        @order = Order.find(params[:id])
        @order_items = OrderDetail.where(order_id: params[:id]).all
        @invited = OrderUser.where(order_id: params[:id]).count
        @accepted = OrderUser.where(order_id: params[:id]).where('notify = 1').count
    end
    
    def new
        @order = Order.new
        @friendships = Friendship.all
        @groups = Group.where(user_id: current_user.id).all
        def upload
            uploaded_file = params[:picture]
            File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
              file.write(uploaded_file.read)
            end
          end
    end
    
    def edit
    end
    
    def update
      @order = Order.find(params[:id])

      if @order.update_attributes(:status => "Closed")
        redirect_to orders_path
      end
    end

    def destroy
      @order = Order.find(params[:id])
      @order_users = OrderUser.where(order_id: params[:id]).all
      
      @order_users.each do |uorder|
        uorder.destroy
      end

      @order.destroy
      redirect_to orders_path
    end
 

    private
    def order_params
      params.require(:order).permit(:order_for, :resturant_name, :picture, order_friends:[], order_groups:[],)
    end
end
