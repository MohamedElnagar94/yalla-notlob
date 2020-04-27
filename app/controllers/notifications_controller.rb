class NotificationsController < ApplicationController
    def index
        @notifications = OrderUser.where(notify: false, user_id: current_user).all
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
        @notify_ord = OrderUser.find(params[:id])
        @id = @notify_ord.order_id
        
        if @notify_ord.update_attributes(:notify => 1)
          redirect_to order_path	(@id)
        end
    end

    def destroy
      @notify_ord = OrderUser.find(params[:id])
      
      if @notify_ord.destroy
        redirect_to notifications_path
      end
    end

end
    
