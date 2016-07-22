class Cart < ActiveRecord::Base
  has_many :cart_items
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => 'Doesn\'t look like an email address'

  def calculate_price
    price = 0
    self.cart_items.each do |cart_item|
      price = price + cart_item.calculate_price
    end

    price
  end

end
