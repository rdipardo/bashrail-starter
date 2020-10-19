require 'test_helper'

class CountryOfOriginTest < ActiveSupport::TestCase
  test 'country_of_origin_test should validate' do
    assert_nothing_raised do
      country_of_origin_test = country_of_origins(:deuxieme)
      assert country_of_origin_test.save!
    end
  end
end
