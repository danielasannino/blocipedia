class ChargesController < ApplicationController

  def create
    @user = current_user

    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 15_00,
      description: "Upgrade to Premium Membership - #{current_user.email}",
      currency: 'usd'
    )

    @user.update_attributes(role: 'premium')


    flash[:notice] = "Thanks for the payment, #{current_user.email}! You can now create and edit private wikis."
    redirect_to root_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership - #{current_user.name}",
      amount: 15_00
    }
  end

  private

  def upgrade_user_role
    @user.role = 'premium'
  end

end
