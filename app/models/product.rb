class Product < ActiveRecord::Base
  validates :title, :description, :photo_url, :slug, presence: true
  validates :price, :numericality => {:greater_than => 0}, :presence => true

  before_create :make_slug

  def calculate_price(quantity)
    # https://developer.paypal.com/docs/classic/paypal-payments-standard/integration-guide/Appx_websitestandard_htmlvariables/#shopping-cart-variables
    # see discount rate discount_rate, discount_rate2

    # if slug == '--nac-jac-file-folders' && quantity > 1
    #   total = 15 * quantity
    # else
    #   total = price * quantity
    # end

    price * quantity
  end

  private

  def make_slug
    self.slug = self.title.parameterize
  end
end
