require "color_me/single_resource"

module ColorMe
  module Payments
    extend SingleResource

    def endpoint
      '/v1/payments.json'
    end

    extend self
  end
end
