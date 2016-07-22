class MailController < ApplicationController
  def contact
    render plain: "success"
  end

  def subscribe
    @mail_subscription = MailSubscription.new(subscription_params)
    if @mail_subscription.save
      render plain: "success", status: :ok
    else
      render json: @mail_subscription.errors, status: :unprocessable_entity
    end
  end

  private

  def subscription_params
    params.require(:mail_subscription).permit(:email)
  end
end
