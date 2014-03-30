class ColorMe
  class Sales < self
    class Stat < self
      class << self
        def get
          res = api.get('/v1/sales/stat.json')
          parse_json(res.body)
        end
      end
    end
  end
end

