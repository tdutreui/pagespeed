# frozen_string_literal: true

module ReportsRecapComponent
  extend ComponentHelper

  def headers
    ['Date', 'Score mobile', 'Score desktop', '']
  end

  def cells report
    [humanized_report_time(report),
     c("google_lighthouse/score", score: report.score_mobile),
     c("google_lighthouse/score", score: report.score_desktop),
     link_to('Show report', lighthouse_report_path(report))
    ]
  end
end
