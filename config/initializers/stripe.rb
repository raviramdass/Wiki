Rails.configuration.stripe = {
  :publishable_key => ['nNMpq7JQQuRGfWNjRxaIcq0S'],
  :secret_key      => ['tCJmRrV24f6GT2DN9xZKiPeD']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]