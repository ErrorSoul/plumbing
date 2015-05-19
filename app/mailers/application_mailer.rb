class ApplicationMailer < ActionMailer::Base

  layout 'mailer'

  default from: Settings.mailer.from

end
