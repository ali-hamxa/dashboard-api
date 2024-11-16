class ApplicationController < ActionController::API
  before_action :authenticate

  def authenticate
    api_key = request.headers['Authorization']

    render json: { message: 'Unauthorised' }, status: :unauthorized unless ApiKey.find_by(key: api_key)
  rescue StandardError
    render json: { message: 'Can not authorise' }, status: :internal_server_error
  end
end
