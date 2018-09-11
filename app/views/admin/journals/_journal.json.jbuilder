json.extract! journal, :id, :name, :about, :issn, :created_at, :updated_at
json.url journal_url(journal, format: :json)
