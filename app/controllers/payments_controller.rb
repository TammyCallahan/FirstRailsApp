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

      if charge.paid
        Order.create(product_id: @product.id, user_id: @user.id, total: @product.price)
        flash[:success] = "Thank you for your order! Your payment was processed successfully."
      end

    rescue Stripe::CardError => e
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

    redirect_to products_url, notice: 'Thank you for your order! It was successfully processed.'
  end

end
