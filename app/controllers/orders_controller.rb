class OrdersController < ApplicationController

    def index
        @orders = Order.all
    end
    def create
        @order = Order.new(order_params.except[order_friends:[]])
        @order.firend = 1 #login_user_id
        @order.status = "Open"
        
        if @order.save
            # invite friends
            order_params['order_friends'].each do |order|
              @friends = OrderUser.new
              @friends.order_id = @order.id
              @friends.user_id = order
              @friends.status = 0
              @friends.save
            end

            redirect_to @order
        else
            render 'new'
        end
    end
    def show
        @order = Order.find(params[:id])
        @order_items = OrderDetail.where(order_id: params[:id]).all
        @invited = OrderUser.where(order_id: params[:id]).count
        @accepted = OrderUser.where(order_id: params[:id]).where('status = 1').count
    end
    def new
        @order = Order.new
        @friendships = Friendship.all
        #@groups = Group.all
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
      @order.destroy
      redirect_to orders_path
    end

 

  private
  def order_params
    params.require(:order).permit(:order_for, :resturant_name, :picture, order_friends:[])
  end
end
