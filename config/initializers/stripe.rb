Rails.configuration.stripe = {
  :publishable_key => ['pk_test_0Zjpzi55MGccc7GR36o6DPZv'],
  :secret_key      => ['sk_test_tCJmRrV24f6GT2DN9xZKiPeD']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]