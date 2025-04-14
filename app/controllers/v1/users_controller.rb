module V1
  class UsersController < ApplicationController
    def create
      result = User::Operation::Create.wtf?(params: user_params)

      if result.success?
        render_json(result[:user], :ok)
      else
        render_errors(result[:'contract.default'].errors.full_messages, :unprocessable_entity)
      end
    end

    private

    def user_params
      params.permit(%w[email password_digets])
    end
  end
end
