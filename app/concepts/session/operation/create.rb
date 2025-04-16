module Session
  module Operation
    class Create < Trailblazer::Operation
      step Model::Find(UserAccount, find_by: :email)
      step :validate_password
      step :create_session

      def validate_password(_ctx, model:, params:, **)
        model.authenticate(params[:password_digest])
      end

      def create_session(ctx, model:, **)
        payload = { user_id: model.id }
        session = JWTSessions::Session.new(payload: payload)
        ctx[:session] = session.login
      end
    end
  end
end
