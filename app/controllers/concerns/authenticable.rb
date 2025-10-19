module Authenticable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request
  end

  private

  def authenticate_request
    header = request.headers['Authorization']
    token = header&.split(' ')&.last

    if token && TokenVerifier.valid?(token)
      @current_user_id = TokenVerifier.user_id(token)
    else
      render json: { error: 'Unauthorized - Invalid or expired token' }, status: :unauthorized
    end
  end

  def current_user_id
    @current_user_id
  end
end
