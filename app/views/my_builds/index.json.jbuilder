json.array!(@my_builds) do |my_build|
  json.extract! my_build, :id, :qty, :scrap_qty, :description, :start_date, :ship_date
  json.url my_build_url(my_build, format: :json)
end
