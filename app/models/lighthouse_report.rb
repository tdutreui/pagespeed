class LighthouseReport < ApplicationRecord
  include PagespeedApiClient

  validates :user, presence: true
  validates :url, presence: {message: "URL must be provided"}
  validates :valid_url, url: true

  before_create :do_lighthouse_report!
  before_validation :set_valid_url

  belongs_to :user

  def do_lighthouse_report!
    r = run_pagespeed(url: self.valid_url, strategy: 'mobile')
    self.json_report_mobile = r.to_json

    r = run_pagespeed(url: self.valid_url, strategy: 'desktop')
    self.json_report_desktop = r.to_json

    self.set_scores!
  end

  def set_valid_url
    self.valid_url = url_with_proto
  end

  def set_scores!
    self.score_desktop = self.report('desktop')['lighthouseResult']["categories"]["performance"]["score"] * 100 rescue nil
    self.score_mobile = self.report('mobile')['lighthouseResult']["categories"]["performance"]["score"] * 100 rescue nil
  end

  def report strategy
    JSON.parse(strategy == 'desktop' ? json_report_desktop : json_report_mobile)
  end

  private

  def url_with_proto url = self.url
    u = URI.parse(url)
    if (!u.scheme)
      url_with_proto('http://' + url)
    elsif (%w{http https}.include?(u.scheme))
      url
    else
      raise "Invalid URL"
    end
  end
end
