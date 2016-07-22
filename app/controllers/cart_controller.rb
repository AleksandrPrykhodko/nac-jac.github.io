class CartController < ApplicationController
  def calculate
    _form_data = JSON.parse params[:form_data]
    _total_sum = 0

    begin
      Product.find(_form_data.keys).each do |product|
        qty = _form_data[product.id.to_s].to_i
        if qty < 0
          raise 'not valid quantity value'
        end
        _total_sum += product.calculate_price(qty)
      end
    rescue
      _total_sum = 0
    end

    render plain: _total_sum
  end

  def checkout
    # save form & chosen products to cart / cart items
    # submit paypal request
  end
end
