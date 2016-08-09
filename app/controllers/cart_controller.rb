class CartController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def calculate
    form_data = JSON.parse params[:form_data] rescue {}
    total_amount = calculate_products_price form_data

    render json: {total: total_amount, form_data: form_data}
  end

  def checkout
    form_data = JSON.parse(params[:form_data]) rescue {}
    total_amount = calculate_products_price form_data
    buyer = Buyer.new buyer_params

    cart = Cart.new email: buyer.email, address: buyer.address1, price: total_amount
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
            name: cart_item.product.title,
            description: cart_item.product.title,
            quantity: cart_item.quantity,
            amount: (cart_item.product.price * 100).to_i
        }
      end

      response = GATEWAY.setup_purchase(
          (cart.price * 100).to_i,
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
      p cart.errors
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

  def calculate_products_price(form_data)
    total_amount = 0

    begin
      Product.find(form_data.keys.map(&:to_i)).each do |product|
        qty_s = form_data[product.id.to_s]

        if qty_s && qty_s.to_i >= 0
          qty = qty_s.to_i
        else
          raise 'not valid quantity value'
        end
        total_amount += product.calculate_price(qty)
      end
    rescue
      total_amount = 0
    end

    total_amount
  end
end
