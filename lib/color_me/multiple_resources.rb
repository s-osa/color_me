module ColorMe
  module MultipleResources
    def max_limit
      50
    end

    def get(params={})
      case params
      when Hash
        return get_with_params(params)
      when Fixnum
        return get_with_id(params)
      end
    end

    private

    def get_with_params(params)
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
      get_url(endpoint + ColorMe.build_query(params))
    end

    def get_with_id(id)
      dirname  = File.join(File.dirname(endpoint), File.basename(endpoint, ".*"))
      filename = id.to_s + File.extname(endpoint)
      get_url(File.join(dirname, filename))
    end

    def get_url(url)
      res = ColorMe.api.get(url)
      ColorMe.parse_json(res.body)
    end
  end
end

