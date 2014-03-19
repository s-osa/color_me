class ColorMe
  class Products < self
    MAX_LIMIT = 50

    class << self
      def get(params={})
        url = '/v1/products.json'
        url <<  params.reduce("?"){|q, v| q << "#{v[0]}=#{v[1]}" } if params.size > 0
        res = api.get(url)
        jsonize(res.body)
      end

      def get_all
        res = get(limit: MAX_LIMIT)
        total = res[:meta][:total]

        while res[:products].size < total do
          limit = [MAX_LIMIT, total - res[:products].size].min
          new_res = get(limit: limit, offset: res[:products].size)
          res[:products] += new_res[:products]
        end

        res
      end
    end
  end
end

