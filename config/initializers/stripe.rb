# Store the environment variables on the Rails.configuration object
 Rails.configuration.stripe = {
   publishable_key: ENV['pk_test_nNMpq7JQQuRGfWNjRxaIcq0S'],
   secret_key: ENV['sk_test_tCJmRrV24f6GT2DN9xZKiPeD']
 }
 
 # Set our app-stored secret key with Stripe
 Stripe.api_key = Rails.configuration.stripe[:secret_key]