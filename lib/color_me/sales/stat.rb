require "color_me/single_resource"

module ColorMe
  module Sales
    module Stat
      extend SingleResource

      def endpoint
        '/v1/sales/stat.json'
      end

      extend self
    end
  end
end

