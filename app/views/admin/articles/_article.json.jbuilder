json.extract! article, :id, :issue, :title, :abstract, :created_at, :updated_at
json.url article_url(article, format: :json)
