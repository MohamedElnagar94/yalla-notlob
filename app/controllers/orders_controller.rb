class OrdersController < ApplicationController
    def index
        @orders = Order.all
    end
    def create
        @order = Order.new(order_params)
        if @order.save
            redirect_to @order
        else
            render 'new'
        end
    end
    def show
        @order = Order.find(params[:id])
    end
    def new
        @order = Order.new

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

    end
    def destroy

    end

 

  private
  def order_params
   
    params.require(:order).permit(:order_for, :resturant_name, :firend, :image)
  end
end