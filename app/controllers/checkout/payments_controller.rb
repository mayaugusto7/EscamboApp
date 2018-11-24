class Checkout::PaymentsController < ApplicationController

  # Email
  # c21730545620961390526@sandbox.pagseguro.com.br
  #
  # Senha
  # WtRVYVcHxB87Kt3u
  #
  # Credit Card
  # Número: 4111111111111111
  # Bandeira: VISA Válido até: 12/2030 CVV: 123

  def create

    ad = Ad.find(params[:ad_id])
    ad.processing!

    order = Order.create(ad: ad, buyer_id: current_member.id)
    order.waiting!

    payment = PagSeguro::PaymentRequest.new

    payment.reference = order.id
    payment.notification_url = checkout_notifications_url #FIX AFTER
    payment.redirect_url =  site_ad_detail_url(ad)

    # site_ad_detail_url http://localhost:3000/site/ad_detail/id
    # site_ad_detail_path /site/ad_detail/id

    payment.items << {
        id: ad.id,
        description: ad.title,
        amount: ad.price.to_s.gsub(',','.')
    }

    response = payment.register

    if response.errors.any?
      redirect_to site_ad_detail_url(ad), alert: "Erro ao processar compra...Entre em contato com SAC (xx) xxxx.xxxx"
    else
      redirect_to response.url
    end

  end
end
