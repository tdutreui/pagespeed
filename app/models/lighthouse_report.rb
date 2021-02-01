class LighthouseReport < ApplicationRecord
  include PagespeedApiClient

  before_create :do_lighthouse_report!
  after_create :send_score_drop_alert
  belongs_to :page
  has_one :user, through: :page

  delegate :url, :valid_url, to: :page

  def do_lighthouse_report!
    r = run_pagespeed(url: page.valid_url, strategy: 'mobile')
    self.json_report_mobile = r.to_json

    r = run_pagespeed(url: page.valid_url, strategy: 'desktop')
    self.json_report_desktop = r.to_json

    self.set_scores!
  end

  def set_scores!
    self.score_desktop = (self.report('desktop')['lighthouseResult']["categories"]["performance"]["score"] * 100).round rescue nil
    self.score_mobile = (self.report('mobile')['lighthouseResult']["categories"]["performance"]["score"] * 100).round rescue nil
  end

  def report strategy
    JSON.parse(strategy == 'desktop' ? json_report_desktop : json_report_mobile)
  end

  def send_score_drop_alert
    previous_report = page.reports.last(2).first
    tolerance = 5

    if (self.score_mobile <= previous_report.score_mobile - tolerance) || ((self.score_desktop <= previous_report.score_desktop - tolerance))
      NotificationMailer.score_drop_to_user(self, previous_report).deliver_now
    end
  end

end
