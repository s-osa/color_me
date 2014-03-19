require "oauth2"
require "json"

require "color_me/version"
require "color_me/shop"
require "color_me/products"

class ColorMe
  class << self
    def token=(token)
      @@token = token
    end

    def api
      client = OAuth2::Client.new(nil, nil, site: 'https://api.shop-pro.jp')
      OAuth2::AccessToken.new(client, @@token)
    end

    def jsonize(json)
      JSON.parse(json, symbolize_names: true)
    end
  end
end
