json.array!(@shares) do |share|
  json.extract! share, :id, :case_log_id, :doctor_id
  json.url share_url(share, format: :json)
end
