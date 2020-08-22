class Page < ApplicationRecord
  require 'uri'

  belongs_to :project, optional: true
  has_one :lighthouse_report
  before_validation :set_valid_url


  validates :url, presence: {message: "URL must be provided"}
  validates :valid_url, url: true, uniqueness: true


  def path
    uri = URI::parse('http://stackoverflow.com/questions/ask')
    uri.path
  end

  def set_valid_url
    self.valid_url = url_with_proto
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
