# frozen_string_literal: true

module GoogleLighthouseScoreComponent
  extend ComponentHelper

  def score_category score
    if score<50
      'fail'
    elsif score <90
      'average'
    else
      'pass'
    end
  end

end
