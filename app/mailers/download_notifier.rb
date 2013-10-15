class DownloadNotifier < ActionMailer::Base
  default from: "from@example.com"
  
  def downloaded(renter)
    @greeting = "Hi"

    mail to: renter.email, subject: 'Download confirmation'
  end
end
