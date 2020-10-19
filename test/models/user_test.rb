require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user should validate' do
    assert_nothing_raised do
      role = \
        Role.create name: Faker::Job.position,
                    description: Faker::Lorem.sentence
      user = users(:nobody)
      user.role_id = role.id
      assert user.save!
    end
  end
end
