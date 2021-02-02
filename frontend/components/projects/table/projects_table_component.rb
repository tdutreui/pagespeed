# frozen_string_literal: true

module ProjectsTableComponent
  extend ComponentHelper

  def columns
    [
      {
        header: 'Website',
        proc: Proc.new do |project|
          [
            project.name,
            project.domain
          ].join("<br/>")
          end
      }, {
        header: 'Score mobile',
        proc: Proc.new do |project|
          component('google_lighthouse/score', score: project.mean_score_mobile.round)
        end
      }, {
        header: 'Score desktop',
        proc: Proc.new do |project|
          component('google_lighthouse/score', score: project.mean_score_desktop.round)
        end
      }, {
        header: 'Pages',
        proc: Proc.new do |project|
          project.pages.count.to_s
        end
      }, {
        header: 'Reports',
        proc: Proc.new do |project|
          project.reports.count.to_s
        end
      }, {
        header: '',
        proc: Proc.new do |project|
            [link_to('Show', project_path(project)),
             link_to('Edit', edit_project_path(project)),
            link_to('Destroy', project, data: {confirm: 'Are you sure?'}, method: :delete)].join(" ")
          end
      }
    ]



  end
end
