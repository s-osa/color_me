require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = "--tag ~online"
end

RSpec::Core::RakeTask.new("spec:online") do |task|
  filename = 'token'
  raise RuntimeError, "'token' file not found" unless File.readable?(filename)

  token = open(filename){|file| token = file.readlines[0].chomp }
  raise RuntimeError, "Token string not found in 'token' file" if token.nil?
end
