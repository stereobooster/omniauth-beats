# OmniAuth Beats

An OmniAuth Strategy for Beats Music OAuth2 API

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-beats'
```

Then `bundle install`.

## Basic Usage

    use OmniAuth::Builder do
      provider "beats", ENV['BEATS_KEY'], ENV['BEATS_SECRET']
    end
