module ColorMe
  module SingleResource
    def get
      res = ColorMe.api.get(endpoint)
      ColorMe.parse_json(res.body)
    end
  end
end
