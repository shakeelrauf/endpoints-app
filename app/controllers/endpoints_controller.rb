class EndpointsController < BaseApiController
  before_action :find_endpoint, only: [:update, :destroy]

  def index
    @endpoints = Endpoint.all.includes(:response)
  end

  def create
    @endpoint = Endpoint.new(endpoint_params)
    render_json_endpoint(@endpoint.save ? :created : :unprocessable_entity)
  end

  def update
    @endpoint.update(endpoint_params)
    render_json_endpoint :ok
  end

  def destroy
    @endpoint.destroy!
    render_json_endpoint :no_content
  end

  private
  def endpoint_params
    endp_params = params.require(:data).require(:attributes)
    endp_params = endp_params.permit(:path,:verb)
    permit_response_attributes(endp_params)
    endp_params
  end

  def permit_response_attributes response_params
    response_params[:response_attributes] =  params.require(:data).require(:attributes)[:response] if params.require(:data).require(:attributes)[:response]
    if response_params[:response_attributes] && response_params[:response_attributes][:headers] 
      response_params[:response_attributes][:headers].permit! 
      response_params[:response_attributes].permit!
    end
  end

  def find_endpoint
    @endpoint = Endpoint.find params[:id]
  end
end