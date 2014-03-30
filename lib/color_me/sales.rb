require "color_me/multiple_resources"

require 'color_me/sales/stat'

module ColorMe
  module Sales
    extend MultipleResources

    def endpoint
      '/v1/sales.json'
    end

    def collection_key
      :sales
    end

    extend self
  end
end


