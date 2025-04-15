module Session
  module Operation
    class Destroy < Trailblazer::Operation
      step :flush_session

      def flust_session(_ctx, payload:, **)
        session = JWTSessions::Session.new(refresh_by_access_allowed: true, payload: payload)
        session.flush_by_access_payload
      end
    end
  end
end
