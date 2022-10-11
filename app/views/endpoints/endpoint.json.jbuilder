if @endpoint&.errors&.empty?
  json.data do
    json.partial! "endpoints/endpoint", endpoint: @endpoint
  end
end