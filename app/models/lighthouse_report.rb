class LighthouseReport < ApplicationRecord
  validates :url, presence: {message: "URL must be provided"}
end
