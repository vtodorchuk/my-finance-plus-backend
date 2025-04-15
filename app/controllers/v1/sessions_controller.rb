module V1
  class SessionsController < ApplicationController
    before_action :authorize_refresh_request!, only: :destroy

    def create
      result = Session::Operation::Create.call(params: user_params)

      if result.success?
        render_json(result[:session], :ok)
      else
        render_errors('Unauthorized', :unauthorized)
      end
    end

    def destroy
      result = Session::Operation::Destroy.call(payload: payload)

      if result.success?
        render_json('', :ok)
      else
        render_json('', :not_found)
      end
    end

    private

    def user_params
      params.permit(%w[email password_digest])
    end
  end
end
