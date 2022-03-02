json.extract! report, :id, :org, :email, :extra_contact_info, :report_id, :begin, :end, :created_at, :updated_at
json.url report_url(report, format: :json)
