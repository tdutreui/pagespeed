class Page < ApplicationRecord
  require 'net/http'

  belongs_to :project, optional: true
  has_one :user, through: :project

  has_many :lighthouse_reports
  alias_attribute :reports, :lighthouse_reports

  before_validation :set_valid_url
  after_create :add_lighthouse_report

  validates :url, presence: { message: "URL must be provided" }
  validates :valid_url, url: true, uniqueness: { scope: :project,
                                                 message: "url already exist in this project" }

  def score_mobile
    lighthouse_reports.last.score_mobile
  end

  def score_desktop
    lighthouse_reports.last.score_desktop
  end

  def add_lighthouse_report
    LighthouseReport.create(page: self)
  end

  def path
    uri = URI::parse(valid_url)
    uri.path
  end

  def domain
    uri = URI::parse(valid_url)
    uri.hostname
  end

  def set_valid_url
    begin
      url_with_proto = url_with_proto(self.url)

      #A safe way to test a URL is to reach it
      uri = URI(url_with_proto)
      res = Net::HTTP.get_response(uri)
      raise "Unable to reach URL" unless res.code && res.code != "500"
      self.valid_url = url_with_proto
    rescue => err
      Rails.logger.error(err)
      Rails.logger.error(err.backtrace)
      false #abort hooks chain and validation
    end

  end

  private

  def url_with_proto url
    u = URI.parse(url)

    if !u.scheme
      url_with_proto('http://' + url)
    elsif %w{http https}.include?(u.scheme)
      url
    else
      raise "Unable to get URL with proto"
    end
  end
end
