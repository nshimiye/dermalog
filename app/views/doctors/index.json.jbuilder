json.array!(@doctors) do |doctor|
  json.extract! doctor, :id, :license, :name, :email, :password, :state, :admin
  json.url doctor_url(doctor, format: :json)
end
