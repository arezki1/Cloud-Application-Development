json.extract! job, :id, :title, :field, :description, :created_at, :updated_at
json.url job_url(job, format: :json)
