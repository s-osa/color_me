require "color_me/version"

module ColorMe
  module ModuleMethods
    def token=(token)
      @@token = token
    end
  end

  extend ModuleMethods
end
