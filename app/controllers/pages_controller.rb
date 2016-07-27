class PagesController < ApplicationController
  def index
    @products = Product.all
  end

  def about
  end

  def terms_of_use
  end

  def privacy_policy
  end
end
