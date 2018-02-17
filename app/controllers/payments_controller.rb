class PaymentsController < ApplicationController

  # POST /payments
  # POST /payments.json
  def create
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user

    # Creates the charge on Stripe's servers - will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: (@product.price * 100).to_i,
        currency: "usd",
        source: token,
        description: params[:stripeEmail],
        receipt_email: params[:stripeEmail]
      )
    rescue Stripe::CardError => e
      # The card has been declined
    end

    redirect_to products_url, notice: 'Thank you for your order! It was successfully processed.'
  end

end
