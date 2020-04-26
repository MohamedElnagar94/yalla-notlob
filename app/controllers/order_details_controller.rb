class OrderDetailsController < ApplicationController

    def index
    end

    def create
      @order_detail = OrderDetail.new(order_details_params)
      @order_detail.user_id = 1 #login_user_id
        
      if @order_detail.save
        redirect_to order_path	(@order_detail.order_id)
      else
          render 'new'
      end
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
      @ord = OrderDetail.find(params[:id])
      @id = @ord.order_id
      @ord.destroy
      redirect_to order_path	(@id)
    end

    private
    def order_details_params
      params.require(:order_detail).permit(:item, :amount, :desc, :price, :order_id)
    end
end
