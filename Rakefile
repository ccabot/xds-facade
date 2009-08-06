require 'rake'
require 'rake/testtask'

test_files_pattern = 'test/**/*_test.rb'
Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = test_files_pattern
  t.verbose = false
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "xds-facade"
    s.author = "Project Laika"
    s.email = "dev@projectlaika.org"
    s.homepage = "http://projectlaika.org"
    s.platform = Gem::Platform::RUBY
    s.summary = "Simple interface for XDS for use with JRuby"
    s.files = FileList["lib/**/*"].to_a
    s.require_path = "lib"
    s.has_rdoc = true
    s.add_dependency('uuid', '2.0.1')
    s.add_dependency('builder', '2.1.2')
    s.add_dependency('activesupport', '>=2.3')
  end
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

