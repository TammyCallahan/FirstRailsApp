class UserMailer < ApplicationMailer
  default from: "hello@tammycallahan.com"

  def contact_form(email, name, message)
    @message = message
    mail(from: email,
         to: 'hello@tammycallahan.com',
         subject: "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "Bike Berlin"
    mail(to: user.email,
         subject: "Welcome to #{@appname}!")
  end

  def order_confirmation(confirmation_email, confirmation_id, confirmation_total)
    @order_id = confirmation_id
    @order_total = confirmation_total
    mail(to: confirmation_email,
         subject: "Thank you for your order!")
  end

end
