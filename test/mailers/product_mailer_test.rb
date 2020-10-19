require 'test_helper'

class ProductMailerTest < ActionMailer::TestCase
  test '.' do
    mail = ProductMailer.dummy
    assert_equal '.', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
