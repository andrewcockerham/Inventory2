json.array!(@parts) do |part|
  json.extract! part, :id, :item_id, :supplier_id
  json.url part_url(part, format: :json)
end
