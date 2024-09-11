require "test_helper"

class TrailerMailerTest < ActionMailer::TestCase
  test "notify_lead" do
    mail = TrailerMailer.notify_lead
    assert_equal "Notify lead", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "notify_shop" do
    mail = TrailerMailer.notify_shop
    assert_equal "Notify shop", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
