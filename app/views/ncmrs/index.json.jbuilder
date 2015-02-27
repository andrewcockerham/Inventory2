json.array!(@ncmrs) do |ncmr|
  json.extract! ncmr, :id, :number
  json.url ncmr_url(ncmr, format: :json)
end
