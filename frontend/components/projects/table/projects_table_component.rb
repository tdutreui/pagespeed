# frozen_string_literal: true

module ProjectsTableComponent
  extend ComponentHelper

  def columns
    [
      {
        header: 'Website',
        proc: Proc.new do |project|
            link_to "#{project.name} #{project.domain}", project
          end
      }, {
        header: 'Actions',
        proc: Proc.new do |project|
            [link_to('Edit', edit_project_path(project)),
            link_to('Destroy', project, data: {confirm: 'Are you sure?'}, method: :delete)].join("\n")
          end
      }
    ]



  end
end
