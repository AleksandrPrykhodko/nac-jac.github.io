class CartItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  validates :quantity, :numericality => {:greater_than => 0}, :presence => true

  def calculate_price
    unless self.product
      raise 'product should be defined'
    end

    price = self.product.price

    if self.product.slug == 'NAC-JAC-FILE-FOLDERS' && self.quantity > 1
      price = 15
    end

    price * self.quantity
  end
end
