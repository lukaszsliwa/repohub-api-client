# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
require './lib/api-client.rb'

Jeweler::Tasks.new do |gem|
  gem.name = "api-client"
  gem.homepage = "http://git.apptamers.com/repohub/api-client"
  gem.license = "MIT"
  gem.summary = %Q{API Client}
  gem.email = "lukasz.sliwa@apptamers.com"
  gem.authors = ["Łukasz Śliwa"]
  gem.version = Api::Client::VERSION
  gem.files =  FileList["[A-Z]*", "{lib,spec}/**/*"]
end
Jeweler::RubygemsDotOrgTasks.new