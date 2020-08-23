module LighthouseReportsHelper
  def lighthouse_strategy_report lighthouse_report, strategy
    lighthouse_report.report(strategy)['lighthouseResult'].to_json.html_safe
  end
end
