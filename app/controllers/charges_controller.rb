class ChargesController < ApplicationController
def create
 
   # Creates a Stripe Customer object, for associating
   # with the charge
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )
 
   # Where the real magic happens
  begin
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: Amount.default,
     description: "Wiki Membership - #{current_user.email}",
     currency: 'usd'
   )
 
    if current_user.update(premium: true)
   flash[:success] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
   redirect_to user_path(current_user) # or wherever
 
 # Stripe will send back CardErrors, with friendly messages
 # when something goes wrong.
 # This `rescue block` catches and displays those errors.
    else
    rescue Stripe::CardError => e
   flash[:error] = e.message
   redirect_to new_charge_path
 end
end
  
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
     email: current_user.email,
     description: "Wiki Membership - #{current_user.name}",
      amount: Amount.default 
    }
  end
end
