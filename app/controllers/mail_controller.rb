class MailController < ApplicationController
  def contact
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactNotifier.send_contact_email(@contact).deliver_now
      render plain: "success", status: :ok
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
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

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
