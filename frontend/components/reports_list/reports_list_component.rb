# frozen_string_literal: true

module ReportsListComponent
  extend ComponentHelper

  def reports
    @page.reports
  end

  def active report
    reports.size==1 || report==@report
  end
end
