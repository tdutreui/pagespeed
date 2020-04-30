json.extract! lighthouse_report, :id, :url, :score, :created_at, :updated_at
json.url lighthouse_report_url(lighthouse_report, format: :json)
