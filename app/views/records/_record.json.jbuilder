json.extract! record, :id, :report_id, :source_ip, :dkim, :spf, :type, :comment, :header_from, :dkim_domain, :dkim_result, :dkim_hresult, :spf_domain, :spf_result, :created_at, :updated_at
json.url record_url(record, format: :json)
