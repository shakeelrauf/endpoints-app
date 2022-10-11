json.cache! ['api', endpoint], expires_in: 10.seconds do
  json.id   endpoint.id
  json.type endpoint.class.table_name
  json.attributes do
    json.verb endpoint.verb
    json.path endpoint.path
    json.response do
      json.partial! "responses/response", response: endpoint.response
    end
  end
end