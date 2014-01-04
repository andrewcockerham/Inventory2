json.array!(@items) do |item|
  json.extract! item, :id, :part_number, :name, :on_order_qty, :in_inspection_qty, :stock_qty, :ncmr_qty, :name_and_number
  json.url item_url(item, format: :json)
end
