class NotificationMailer < ApplicationMailer
  add_template_helper(LighthouseReportsHelper)
  def score_drop_to_user(report, previous_report)

    @previous_report = previous_report
    @report = report
    mail(
      to: @report.user.email,
      subject: "#{APPNAME} - Significant performance drop - #{@report.valid_url}",
    )
  end

end