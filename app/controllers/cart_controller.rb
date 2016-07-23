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

    render json: { total: _total_sum, form_data: _form_data }
  end

  def checkout
    form_data = JSON.parse(params[:form_data]) rescue {}
    buyer = Buyer.new buyer_params

    # FIXME - security issue
    # Cart price should be recalculated locally(instead of use amount from params) - see product.calculate_price
    # sum of "product.calculate_price(qty.to_i)"
    cart = Cart.new email: buyer.email, address: buyer.address1, price: params[:price]
    form_data.each do |id, qty|
      product = Product.find(id.to_s)
      if product
        cart.cart_items << CartItem.new(product: product, quantity: qty.to_i, price: product.price)
      end
    end
    cart.buyer = buyer
    if cart.save
      items = cart.cart_items.map do |cart_item|
        {
          notice_no: cart_item.product.title,
          description: cart_item.product.description,
          quantity: cart_item.quantity,
          amount: cart_item.product.calculate_price(cart_item.quantity)
        }
      end
      response = GATEWAY.setup_purchase(
        cart.price * 100,
        ip: request.remote_ip,
        return_url: confirm_url,
        cancel_return_url: root_url,
        currency: 'USD',
        allow_guest_checkout: true,
        items: items
      )
      cart.update_attribute :token, response.token
      redirect_to GATEWAY.redirect_url_for(response.token)
    else
      raise 'error occurred :('
    end
  end

  def confirm
    cart = Cart.find_by_token params[:token]
    cart.update_attribute :completed, true if cart

    # do something instead of redirect
    redirect_to root_path
  end

  private

  def buyer_params
    params.permit(:first_name, :last_name, :email, :address1, :address2, :state, :zip, :country)
  end
end
