project_root = File.join(File.dirname(__FILE__), '..')
$: << project_root

require 'lib/color_me'

def token
  return nil unless File.exists?('token')
  @token ||= open('token'){|file| token = file.readlines[0].chomp }
end

ColorMe.token = token || "TOKEN"
