class Project < ApplicationRecord
  include ProjectsConcern
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


end
