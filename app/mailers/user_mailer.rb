class UserMailer < ApplicationMailer
  default from: "hello@tammycallahan.com"

  def contact_form(email, name, message)
    @message = message
    mail(from: email,
         to: 'hello@tammycallahan.com',
         subject: "A new contact form message from #{name}")
  end
end
