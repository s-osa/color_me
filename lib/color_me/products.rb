class ColorMe
  class Products < self
    MAX_LIMIT = 50

    class << self
      def get(params={})
        url = '/v1/products.json'
        url << "?" << params.map{|v| "#{v[0]}=#{v[1]}" }.join("&") if params.size > 0
        res = api.get(url)
        parse_json(res.body)
      end

      def get_all
        res = get(limit: 1)
        total = res[:meta][:total]

        while res[:products].size < total do
          limit = [MAX_LIMIT, total - res[:products].size].min
          offset = res[:products].size
          new_res = get(limit: limit, offset: offset)
          res[:products] += new_res[:products]
        end

        res
      end
    end
  end
end

