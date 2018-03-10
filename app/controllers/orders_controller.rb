class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    if current_user.admin?
      @orders = Order.includes(:product).all
    else
      @orders = Order.includes(:product, :user).where(user_id: current_user.id).all
    end
  end

  def show
  end

  def new
  end

  def create
    # if @order.persisted?
    #   # @confirmation_email = current_user.email
    #   # @confirmation_id = order.id
    #   # @confirmation_total = order.total
    #   # UserMailer.order_confirmation(@confirmation_email, @confirmation_ID, @confirmation_total).deliver_now
    # end
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

end
