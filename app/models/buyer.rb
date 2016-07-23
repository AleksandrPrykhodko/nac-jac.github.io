class Buyer < ActiveRecord::Base
  validates :first_name, :last_name, :email, :address1, :address2, :state, :zip, :country, presence: true
end
