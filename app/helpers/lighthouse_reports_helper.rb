module LighthouseReportsHelper
  def lighthouse_strategy_report lighthouse_report, strategy
    lighthouse_report.report(strategy)['lighthouseResult'].to_json.html_safe
  end


  def score_category score
    if score<50
      'fail'
    elsif score <90
      'average'
    else
      'pass'
    end
  end

  def humanized_report_time report
    l(report.created_at, format: '%Y-%m-%d - %H:%M')
  end
end
