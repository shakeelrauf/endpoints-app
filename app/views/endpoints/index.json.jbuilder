json.data do
  json.partial! 'endpoint', collection: @endpoints, as: :endpoint
end