class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('MAILER_SMTP_USER_NAME')
  layout 'mailer'
end
