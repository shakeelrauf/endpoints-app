class ErrorsController < BaseApiController
  before_action :find_endpoint, only: [:not_found]

  def not_found
    return render json: @endpoint.response.body, status: :ok if @endpoint
    render_json_error_message(:not_found)
  end

  def find_endpoint
    @endpoint = Endpoint.where(path: request.env["REQUEST_PATH"],verb: request.env["action_dispatch.original_request_method"].upcase).first
  end

  
end
