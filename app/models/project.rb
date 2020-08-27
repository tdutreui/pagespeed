class Project < ApplicationRecord
  belongs_to :user
  has_many :pages

  def score_mobile
    pages.last.score_mobile
  end

  def score_desktop
    pages.last.score_desktop
  end
end
