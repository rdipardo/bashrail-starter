require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test 'product should validate' do
    assert_nothing_raised do
      producer = CountryOfOrigin.create! name: Faker::Address.country,
                                         ctype: '67',
                                         fdate: Time.now
      product = Product.create! name: Faker::Commerce.product_name,
                                pcolor: Faker::Color.color_name,
                                pdate: Time.now,
                                country_of_origin_id: producer.id,
                                active_status: 0,
                                sort_order: 1
      assert product.save!
    end
  end
end
