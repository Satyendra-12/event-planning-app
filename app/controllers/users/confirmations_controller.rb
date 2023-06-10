
class Users::ConfirmationsController < Devise::ConfirmationsController
  skip_before_action :verify_authenticity_token
  include Responses
  respond_to :json

  def create
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      resource.update(status: User.statuses[:active], is_verified: User.statuses[:verified],unconfirmed_email: "confirmed")
      render json: { message: 'Account confirmed successfully.', user: resource }
    else
      render json: { error: 'Unable to confirm account.' }, status: :unprocessable_entity
    end
  end

  # def create
  #   self.resource = resource_class.confirm_by_token(params[:confirmation_token])
  #   yield resource if block_given?
  
  #   if resource.errors.empty?
  #     resource.update(
  #       status: User.statuses[:active],
  #       is_verified: User.statuses[:verified],
  #       unconfirmed_email: "confirmed",
  #       devise_token: params[:devise_token], # Include the devise_token value from the request
  #       devise_type: params[:devise_type] # Include the devise_type value from the request
  #     )
  #     success('Account confirmed successfully.')
  #   else
  #     error('Unable to confirm account.')
  #   end
  # end
  
end
