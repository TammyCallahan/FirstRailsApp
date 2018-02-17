if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_ZoYmWJ9xwb3aXfkG1s5xrpYD',
    secret_key: 'sk_test_Ep78ypM9MwsDqxrSaZle63Em'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
