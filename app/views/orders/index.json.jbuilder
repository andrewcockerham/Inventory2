json.array!(@orders) do |order|
  json.extract! order, :id, :purchase_order_id, :supplier_id
  json.url order_url(order, format: :json)
end
