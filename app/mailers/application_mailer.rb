class ApplicationMailer < ActionMailer::Base
  default from: Rails.configuration.emails[:from]
  layout 'mailer'

end
