require 'test_helper'

class DownloadNotifierTest < ActionMailer::TestCase
  test "downloaded" do
    mail = DownloadNotifier.downloaded(renters(:one))
    assert_equal "Download confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
