require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test 'role should validate' do
    assert_nothing_raised do
      roles = roles(:primero)
      assert roles.save!
    end
  end
end
