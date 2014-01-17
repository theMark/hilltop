require 'test_helper'

class GoalMailerTest < ActionMailer::TestCase
  test "progress_report" do
    mail = GoalMailer.progress_report
    assert_equal "Progress report", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
