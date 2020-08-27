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
            link_to( project.domain, project)
          ].join("<br/>")
          end
      }, {
        header: 'Score mobile',
        proc: Proc.new do |project|
          component('google_lighthouse/score', score: project.score_mobile)
        end
      }, {
        header: 'Score desktop',
        proc: Proc.new do |project|
          component('google_lighthouse/score', score: project.score_desktop)
        end
      }, {
        header: '',
        proc: Proc.new do |project|
            [link_to('Edit', edit_project_path(project)),
            link_to('Destroy', project, data: {confirm: 'Are you sure?'}, method: :delete)].join(" ")
          end
      }
    ]



  end
end
