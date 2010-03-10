require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'echoe'

Echoe.new('360_services', '0.0.8') do |p|
  p.description    = "Ruby bindings for Sorenson 360"
  p.url            = "http://github.com/sorenson/360_services"
  p.author         = "Sorenson Media"
  p.email          = "video@sorensonmedia.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = %w(echoe cucumber rspec netrecorder)
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }

rerun = File.file?('rerun.txt') ? IO.read('rerun.txt') : ""
rerun_opts = rerun.to_s.strip.empty? ? "--format progress features" : "--format #{ENV['CUCUMBER_FORMAT'] || 'pretty'} #{rerun}"
std_opts = "#{rerun_opts} --format rerun --out rerun.txt --strict --tags ~@wip"

namespace :cucumber do
  Cucumber::Rake::Task.new(:ok, 'Run features that should pass') do |t|
    t.fork = true # You may get faster startup if you set this to false
    t.cucumber_opts = std_opts
    t.rcov=true
  end
end

task :default => :cucumber
task :cucumber => 'cucumber:ok'
