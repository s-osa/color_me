require 'color_me/sales/stat'

class ColorMe
  class Sales < self
    MAX_LIMIT = 50

    class << self
      def get(params={})
        url = '/v1/sales.json'
        url << "?" << params.map{|v| "#{v[0]}=#{v[1]}" }.join("&") if params.size > 0
        res = api.get(url)
        parse_json(res.body)
      end

      def get_all
        res = get(limit: 1)
        total = res[:meta][:total]

        while res[:sales].size < total do
          limit = [MAX_LIMIT, total - res[:sales].size].min
          offset = res[:sales].size
          new_res = get(limit: limit, offset: offset)
          res[:sales] += new_res[:sales]
        end

        res
      end
    end
  end
end


