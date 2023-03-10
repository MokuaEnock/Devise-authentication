class SessionsController < ApplicationController
  Devise::SessionsController

  respond_to :json

  private

  def respond_with(response, _opts = {})
    render json: { message: "You are logged in." }, status: :ok
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: { message: "Yo are logged out." }, status: :ok
  end

  def log_out_failure
    render json: { message: "Sorry nothing happened" }, status: :unauthorized 
  end
end
