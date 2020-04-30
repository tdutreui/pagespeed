class StaffMailer < ApplicationMailer
  default to: Rails.configuration.emails.staff


end