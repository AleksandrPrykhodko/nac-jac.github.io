class CartItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  validates :quantity, :numericality => {:greater_than => 0}, :presence => true

  def calculate_price
    unless self.product
      raise 'product should be defined'
    end

    self.product.calculate_price self.quantity
  end
end
