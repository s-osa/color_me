require "oauth2"
require "json"

require "color_me/version"
require "color_me/shop"
require "color_me/sales"
require "color_me/products"
require "color_me/payments"

module ColorMe
  def token=(token)
    @@token = token
  end

  def build_query(params)
    query = "?"
    query << params.map{|v| "#{v[0]}=#{v[1]}" }.join("&")
  end

  def api
    client = OAuth2::Client.new(nil, nil, site: 'https://api.shop-pro.jp')
    OAuth2::AccessToken.new(client, @@token)
  end

  def parse_json(json)
    JSON.parse(json, symbolize_names: true)
  end

  extend self
end
