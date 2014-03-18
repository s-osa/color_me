project_root = File.join(File.dirname(__FILE__), '..')
$: << project_root

require 'lib/color_me'

def token
  @token ||= open('token'){|file| token = file.readlines[0].chomp }
end
