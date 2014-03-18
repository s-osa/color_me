class ColorMe
  class Shop < self
    class << self
      def get
        res = api.get('/v1/shop.json')
        jsonize(res.body)
      end
    end
  end
end
