class Product < ActiveRecord::Base
  validates :title, :description, :photo_url, :slug, presence: true
  validates :price, :numericality => {:greater_than => 0}, :presence => true

  before_create :make_slug

  def calculate_price(quantity)
    if slug == 'nac-jac-file-folders' && quantity > 1
      total = 15 * quantity
    else
      total = price * quantity
    end

    total
  end

  private

  def make_slug
    self.slug = self.title.parameterize
  end
end
