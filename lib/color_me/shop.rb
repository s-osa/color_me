class ColorMe
  class Shop < self
    class << self
      def get
        res = api.get('/v1/shop.json')
        parse_json(res.body)
      end
    end
  end
end
