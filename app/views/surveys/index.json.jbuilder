json.array!(@surveys) do |survey|
  json.extract! survey, :id, :name, :csv, :title
  json.url survey_url(survey, format: :json)
end
