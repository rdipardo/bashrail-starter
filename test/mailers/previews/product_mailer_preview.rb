# Preview all emails at http://localhost:3000/rails/mailers/product_mailer
class ProductMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/product_mailer/.
  def initialize
    ProductMailer.new
  end
end
