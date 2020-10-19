require 'test_helper'

class PfeatureTest < ActiveSupport::TestCase
  test 'pfeature should validate' do
    assert_nothing_raised do
      pfeature = pfeatures(:two)
      assert pfeature.save!
    end
  end
end
