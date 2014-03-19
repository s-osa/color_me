class ColorMe
  class Products < self
    class << self
      def get(params={})
        url = '/v1/products.json'
        url <<  params.reduce("?"){|q, v| q << "#{v[0]}=#{v[1]}" } if params.size > 0
        res = api.get(url)
        jsonize(res.body)
      end
    end
  end
end

