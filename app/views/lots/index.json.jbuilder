json.array!(@lots) do |lot|
  json.extract! lot, :id, :number, :initial_qty, :current_qty, :item_id, :cleaned
  json.url lot_url(lot, format: :json)
end
