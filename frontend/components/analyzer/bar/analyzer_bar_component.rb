# frozen_string_literal: true

module AnalyzerBarComponent
  extend ComponentHelper

  def bar_classes theme
    (theme=='white' ? 'is-white' : 'is-blue')
  end

  def container_classes theme
    (theme=='white' ? 'is-blue' : 'is-white')
  end
end
