json.extract! contact, :id, :journal_id, :email, :telephone, :addr, :created_at, :updated_at
json.url contact_url(contact, format: :json)
