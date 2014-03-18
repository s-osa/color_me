require "color_me/version"

class ColorMe
  class << self
    def token=(token)
      @@token = token
    end
  end
end
