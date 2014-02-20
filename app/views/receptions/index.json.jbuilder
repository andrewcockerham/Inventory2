json.array!(@receptions) do |reception|
  json.extract! reception, :id, :date, :quantity, :description
  json.url reception_url(reception, format: :json)
end
