module ProjectsRecapComponent
  extend ComponentHelper

  def headers
    columns.map { |c| c[:header] }
  end

  def columns
    @columns ||= [
      {
        header: 'Page',
        proc: Proc.new do |page|
          link_to(page.path.presence || page.domain, page.valid_url, target: :blank)

        end
      }, {
        header: 'Last analysis',
        proc: Proc.new do |page|
          humanized_report_time(page.reports.last)
        end
      }, {
        header: 'Score mobile',
        proc: Proc.new do |page|
          component('google_lighthouse/score', score: page.score_mobile)
        end
      }, {
        header: 'Score desktop',
        proc: Proc.new do |page|
          component('google_lighthouse/score', score: page.score_desktop)
        end
      }, {
        header: 'History',
        proc: Proc.new do |page|
          link_to("#{pluralize(page.reports.count, "report")}", page, class: 'projects-recap-reports')
        end

      }
    ]
  end
end
