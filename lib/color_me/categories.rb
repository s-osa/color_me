require "color_me/single_resource"

module ColorMe
  module Categories
    extend SingleResource

    def endpoint
      '/v1/categories.json'
    end

    extend self
  end
end
