require 'sinatra'
require 'omniauth-beats'

use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :beats, ENV["BEATS_KEY"], ENV["BEATS_SECRET"]
end

get '/' do
  <<-HTML
  <a href='/auth/beats'>Sign in with Beats Music</a>
  HTML
end

get '/auth/beats/callback' do
  auth = request.env['omniauth.auth']
  redirect '/'
end

get '/auth/failure' do
  puts params[:message]
  redirect '/'
end
