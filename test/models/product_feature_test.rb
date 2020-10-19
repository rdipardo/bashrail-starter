require 'test_helper'

class ProductFeatureTest < ActiveSupport::TestCase
  test 'product_feature should validate' do
    assert_nothing_raised do
      producer = CountryOfOrigin.create! name: Faker::Address.country,
                                         ctype: '67',
                                         fdate: Time.now
      product = Product.create! name: Faker::Commerce.product_name,
                                country_of_origin_id: producer.id
      feature = Pfeature.create! name: Faker::Commerce.color
      prod_feat = ProductFeature.create! name: product.name,
                                         product_id: product.id,
                                         pfeature_id: feature.id,
                                         sort_order: 4,
                                         active_status: 1
      assert prod_feat.save!
    end
  end
end
