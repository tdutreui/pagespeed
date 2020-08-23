class LighthouseReport < ApplicationRecord
  include PagespeedApiClient

  before_create :do_lighthouse_report!
  belongs_to :page

  delegate :url, to: :page

  def do_lighthouse_report!
    r = run_pagespeed(url: page.valid_url, strategy: 'mobile')
    self.json_report_mobile = r.to_json

    r = run_pagespeed(url: page.valid_url, strategy: 'desktop')
    self.json_report_desktop = r.to_json

    self.set_scores!
  end


  def set_scores!
    self.score_desktop = self.report('desktop')['lighthouseResult']["categories"]["performance"]["score"] * 100 rescue nil
    self.score_mobile = self.report('mobile')['lighthouseResult']["categories"]["performance"]["score"] * 100 rescue nil
  end

  def report strategy
    JSON.parse(strategy == 'desktop' ? json_report_desktop : json_report_mobile)
  end

end
