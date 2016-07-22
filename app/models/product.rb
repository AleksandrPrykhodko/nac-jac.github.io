class Product < ActiveRecord::Base
  validates :title, :description, :photo_url, :slug, presence: true
  validates :price, :numericality => {:greater_than => 0}, :presence => true

  before_create :make_slug
  private

  def make_slug
    self.slug = self.title.parameterize
  end
end
