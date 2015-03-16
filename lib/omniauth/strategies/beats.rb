require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Beats < OmniAuth::Strategies::OAuth2
      option :name, 'beats'

      option :client_options, {
        site: 'https://partner.api.beatsmusic.com',
        authorize_url: 'https://partner.api.beatsmusic.com/v1/oauth2/authorize',
        token_url: 'https://partner.api.beatsmusic.com/v1/oauth2/token'
      }

      uid { user_data['id'] }

      info do
        {
          name: user_data['full_name'],
          nickname: user_data['username']
        }
      end

      extra do
        { user_data: user_data }
      end

      def user_data
        user_id = access_token.get('/v1/api/me').parsed["result"]["user_context"]
        @user_data ||= access_token.get("/v1/api/users/#{ user_id }").parsed["data"]
      end

      # Workaround for for https://github.com/intridea/omniauth-oauth2/issues/28
      def callback_url
        full_host + script_name + callback_path + query_string
      end
    end
  end
end
