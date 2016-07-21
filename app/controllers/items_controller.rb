class ItemsController < ApplicationController
  def prepare
    @id = params[:id]
  end

  def buy
    item = Item.find(params[:id])
    price_in_cents = (item[:price]*100).round

    return render text: price_in_cents

    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    # transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
    # cart.update_attribute(:purchased_at, Time.now) if response.success?
    # response.success?
  end
end
