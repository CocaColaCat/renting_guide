class DownloadNotifier < ActionMailer::Base
  default from: ""
  
  def downloaded(renter)
    mail to: renter.email, subject: 'Download confirmation'
  end
end
