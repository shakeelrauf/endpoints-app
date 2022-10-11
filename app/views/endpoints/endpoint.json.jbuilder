if @endpoint&.errors&.empty?
  json.data do
    json.partial! "endpoints/endpoint", endpoint: @endpoint
  end
else
  json.errors do
    @endpoint.errors.messages
  end
end