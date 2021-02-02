class Project < ApplicationRecord
  belongs_to :user
  has_many :pages
  has_many :lighthouse_reports, through: :pages
  alias_attribute :reports,:lighthouse_reports


  def mean_score_mobile
    mean pages.map(&:score_mobile)
  end

  def mean_score_desktop
    mean pages.map(&:score_desktop)
  end

  def display_name
    name || domain
  end

  private

  def mean a
    a.sum(0.0) / a.size
  end
end
