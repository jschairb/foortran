require 'bundler/gem_tasks'
require 'rake/testtask'

task :default => :test

Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.pattern = "spec/**/*_spec.rb"
  t.verbose = true
end
