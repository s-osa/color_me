require "color_me/multiple_resources"

module ColorMe
  module Products
    extend MultipleResources

    def endpoint
      '/v1/products.json'
    end

    def collection_key
      :products
    end

    extend self
  end
end

