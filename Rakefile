require 'bundler/gem_tasks'
require 'rake/testtask'

task :default => :test

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

require 'image_optim_rake/image_optim_task'
ImageOptimRake::ImageOptimTask.new
