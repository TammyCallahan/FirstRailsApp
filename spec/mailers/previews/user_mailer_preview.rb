# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("maya@tammycallahan.com", "Maya", "Hello World!")
  end

  def welcome
    UserMailer.welcome("maya@tammycallahan.com", "Maya")
  end

  def order_confirmation
    UserMailer.order_confirmation("maya@tammycallahan.com", 12, 12.5)
  end
end
