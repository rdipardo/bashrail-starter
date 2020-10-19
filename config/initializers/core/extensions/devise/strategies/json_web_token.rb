# Your actual JWT Strategy
# "config/initializers/core_extensions/devise/strategies/json_web_token.rb"

module Devise
  module Strategies
    class JsonWebToken < Base
      def valid?
        request.headers['Authorization'].present?
      end

      def authenticate!
        return fail! unless claims
        return fail! unless claims.key?('user_id')

        success! User.find_by_id claims['user_id']
      end

      protected ######################## PROTECTED #############################

      def claims
        strategy, token = request.headers['Authorization'].split(' ')

        return nil if (strategy || '').downcase != 'bearer'

        begin
          JWTWrapper.decode(token)
        rescue StandardError
          nil
        end
      end
    end
  end
end
