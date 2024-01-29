class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def pundit_user
    current_api_v1_user
  end

  private

  def user_not_authorized
    render json: { error: 'Not authorized to perform this action' }
  end
end
