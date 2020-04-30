class LighthouseReport < ApplicationRecord
  validates :url, presence: {message: "URL must be provided"}

  before_save :set_score, unless: :score

  def set_score
    self.score=self.report['lighthouseResult']["categories"]["performance"]["score"]*100 rescue nil
  end

  def report
    JSON.parse(json_report)
  end
end
