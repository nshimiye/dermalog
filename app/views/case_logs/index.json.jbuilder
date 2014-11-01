json.array!(@case_logs) do |case_log|
  json.extract! case_log, :id, :patient_name, :patient_date_of_birth, :patient_gender, :description, :diagnosis, :treatment, :title, :doctor_id
  json.url case_log_url(case_log, format: :json)
end
