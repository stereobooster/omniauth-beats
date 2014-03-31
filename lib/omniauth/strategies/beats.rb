require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Beats < OmniAuth::Strategies::OAuth2

      option :name, 'beats'

      option :client_options, {
        site: 'https://partner.api.beatsmusic.com/v1/',
        authorize_url: 'https://partner.api.beatsmusic.com/v1/oauth2/authorize',
        token_url: 'https://partner.api.beatsmusic.com/v1/oauth2/token'
      }

      # uid { user_data['user_context'] }

      def user_data

      end
    end
  end
end

# uid { user_data['key'] }

# info do
#   {
#       first_name: user_data['firstName'],
#       last_name: user_data['lastName'],
#       icon: user_data['icon'],
#       email: user_data['email'],
#       gender: user_data['gender'],
#       key: user_data['key']
#   }
# end

# extra do
#   { :user_data => user_data }
# end

# EXTRAS = 'email,followingUrl,isTrial,artistCount,heavyRotationKey,networkHeavyRotationKey,albumCount,trackCount,username,collectionUrl,playlistsUrl,collectionKey,followersUrl,displayName,isUnlimited,isSubscriber'

# def user_data
#   uri = URI('https://www.rdio.com/api/1/')
#   res = Net::HTTP.post_form(uri, 'method' => 'currentUser', 'extras' => EXTRAS, 'access_token' => access_token.token)
#   @user_data ||= MultiJson.decode(res.body)['result']
# end

# require 'omniauth/strategies/oauth2'

# module OmniAuth
#   module Strategies
#     class Shopify < OmniAuth::Strategies::OAuth2
#       # Available scopes: content themes products customers orders script_tags shipping
#       # read_*  or write_*
#       DEFAULT_SCOPE = 'read_products'

#       option :client_options, {
#         :authorize_url => '/admin/oauth/authorize',
#         :token_url => '/admin/oauth/access_token'
#       }

#       option :callback_url
      
#       option :provider_ignores_state, true
#       option :myshopify_domain, 'myshopify.com'

#       uid { URI.parse(options[:client_options][:site]).host }

#       def valid_site?
#         !!(/\A(https|http)\:\/\/[a-zA-Z0-9][a-zA-Z0-9\-]*\.#{Regexp.quote(options[:myshopify_domain])}[\/]?\z/ =~ options[:client_options][:site])
#       end

#       def fix_https
#         options[:client_options][:site].gsub!(/\Ahttp\:/, 'https:')
#       end

#       def setup_phase
#         super
#         fix_https
#       end

#       def request_phase
#         if valid_site?
#           super
#         else
#           fail!(:invalid_site)
#         end
#       end

#       def authorize_params
#         super.tap do |params|
#           params[:scope] ||= DEFAULT_SCOPE
#         end
#       end

#       def callback_url
#         options.callback_url || super
#       end
#     end
#   end
# end
