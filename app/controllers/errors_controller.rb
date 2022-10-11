class ErrorsController < BaseApiController
  before_action :find_endpoint, only: [:not_found]

  def not_found
    return render json: @endpoint.response.body, status: :ok if @endpoint
    render :json => {
      "errors": [
          {
            "code": "not_found",
            "detail": "Requested page `#{request.env["REQUEST_PATH"]}` does not exist"
          }
        ]
      }.to_json, :status => :not_found
  end

  def find_endpoint
    @endpoint = Endpoint.where(path: request.env["REQUEST_PATH"],verb: request.env["action_dispatch.original_request_method"].upcase).first
  end
end
