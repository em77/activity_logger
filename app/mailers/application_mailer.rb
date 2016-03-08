class ApplicationMailer < ActionMailer::Base
  default from: "reset@#{ENV["DOMAIN"]}"
  layout 'mailer'
end
