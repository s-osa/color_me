module ColorMe
  module MultipleResources
    def max_limit
      50
    end

    def get(params={})
      res = partial_get(params)
      total = [res[:meta][:total], params[:limit]].reject(&:nil?).min

      while res[collection_key].size < total do
        limit = [max_limit, total - res[collection_key].size].min
        offset = res[collection_key].size
        new_res = partial_get(params.merge(limit: limit, offset: offset))
        res[collection_key] += new_res[collection_key]
      end
      res
    end

    def partial_get(params={})
      url = endpoint + ColorMe.build_query(params)
      res = ColorMe.api.get(url)
      ColorMe.parse_json(res.body)
    end
  end
end

