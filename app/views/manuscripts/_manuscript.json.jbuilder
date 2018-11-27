json.extract! manuscript, :id, :title, :journal_id, :abstract, :approval, :created_at, :updated_at
json.url manuscript_url(manuscript, format: :json)
