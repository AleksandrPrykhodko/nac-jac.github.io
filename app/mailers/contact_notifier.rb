class ContactNotifier < ApplicationMailer
  include SendGrid

  def send_contact_email(contact)
    @contact = contact
    mail( :from => @contact.email,
          :to => ENV['ADMIN_EMAIL'],
          :subject => @contact.subject,
    )
  end
end
