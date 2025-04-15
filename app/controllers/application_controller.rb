# frozen_string_literal: true

class ApplicationController < ActionController::API
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  private

  def not_authorized
    render_errors('Not authorized', :unauthorized)
  end

  def render_json(json, status)
    render json:, status:
  end

  def render_errors(json, status)
    render json: { errors: json }, status:
  end
end
