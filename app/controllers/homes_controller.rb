class HomesController < ApplicationController
  def index
    @order = Order.order(created_at: :desc).last(5)
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
