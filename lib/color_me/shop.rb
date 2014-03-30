require "color_me/single_resource"

module ColorMe
  module Shop
    extend SingleResource

    def endpoint
      '/v1/shop.json'
    end

    extend self
  end
end
