class SessionsController < ApplicationController
  Devise::SessionsController

  respond_to :json

  private

  def respond_with(response, _opts = {})
    render json: { message: "You are logged in." }, status: :ok
  end
end
