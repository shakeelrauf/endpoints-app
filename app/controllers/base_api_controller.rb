class BaseApiController < ActionController::API
  include ActionController::Caching
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { "errors": [
      {
          "code": "not_found",
          "detail": "Requested Endpoint with ID `#{params[:id]}` does not exist"
      }
    ]},status: :not_found
  end

  def render_json_endpoint status=:ok
    render :endpoint, status: status
  end

  def render_json_error_message stauts=:not_found
    render :json => {
      "errors": [
          {
            "code": "not_found",
            "detail": "Requested page `#{request.env["REQUEST_PATH"]}` does not exist"
          }
        ]
      }.to_json, :status => status
  end
end
