class ProductMailer < ApplicationMailer
  default from: ENV['SMTP_USERNAME']

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailer...subject
  #
  def dummy
    @greeting = 'Hi'

    mail(to: 'to@example.org', from: 'from@example.com',
         subject: '.', body: @greeting)
  end

  def product_email(product)
    @product = product

    mlist_dev = [
      'you@your-domain.com',
      ENV['SMTP_USERNAME']
    ]

    mlist_prod = mlist_dev.reject { |e| e == 'you@your-domain.com' }

    if ENV['RAILS_ENV'].downcase == 'production'
      mail(to: mlist_prod, subject: "Information about #{product.name}")
    else
      mail(to: mlist_dev, subject: "Test message re. #{product.name} sent #{Time.now}")
    end
  end
end
