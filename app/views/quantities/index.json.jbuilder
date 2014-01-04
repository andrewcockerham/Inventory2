json.array!(@quantities) do |quantity|
  json.extract! quantity, :id, :amount
  json.url quantity_url(quantity, format: :json)
end
