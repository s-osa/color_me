module ColorMe
  module MultipleResources
    def max_limit
      50
    end

    def get(params={})
      url = endpoint + ColorMe.build_query(params)
      res = ColorMe.api.get(url)
      ColorMe.parse_json(res.body)
    end

    def get_all
      res = get(limit: 1)
      total = res[:meta][:total]

      while res[collection_key].size < total do
        limit = [max_limit, total - res[collection_key].size].min
        offset = res[collection_key].size
        new_res = get(limit: limit, offset: offset)
        res[collection_key] += new_res[collection_key]
      end

      res
    end
  end
end

