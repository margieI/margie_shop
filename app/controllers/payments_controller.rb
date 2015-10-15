class PaymentsController < ApplicationController

	def create
    token = params[:stripeToken]
    product = Product.find(params[:product_id])

    # debugger

    # Rails.logger.debug "Product name: #{product.name}"

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        #:amount => (product.price * 100).to_i #2000, # amount in cents, again
        :amount => 2000,
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail]
      )
    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    redirect_to product_path(product), notice: "Your order has been placed, and you have been charged."
  end
end