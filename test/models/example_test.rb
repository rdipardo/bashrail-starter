require 'test_helper'

class ExampleTest < ActiveSupport::TestCase
  test 'example should validate' do
    assert_nothing_raised do
      example = examples("\u{4e8c}")
      assert example.save!
    end
  end
end
