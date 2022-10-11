class EndpointsController < BaseApiController
  before_action :find_endpoint, only: [:update, :destroy]

  def index
    @endpoints = Endpoint.all.includes(:response)
  end

  def create
    @endpoint = Endpoint.new(endpoint_params)
    render :endpoint, status: @endpoint.save ? :created : :unprocessable_entity
  end

  def update
    @endpoint.update(endpoint_params)
    render :endpoint, status: :ok
  end

  def destroy
    @endpoint.destroy!
    render :endpoint, status: :no_content
  end

  private
  def endpoint_params
    endp_params = params.require(:data).require(:attributes)
    endp_params = endp_params.permit(:path,:verb)
    endp_params[:response_attributes] = params.require(:data).require(:attributes)[:response] 
    endp_params[:response_attributes][:headers].permit! if endp_params[:response_attributes][:headers]
    endp_params[:response_attributes].permit!
    endp_params
  end

  def find_endpoint
    @endpoint = Endpoint.find params[:id]
  end
end