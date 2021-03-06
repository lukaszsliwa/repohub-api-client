# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: repofs-api-client 1.1.9 ruby lib

Gem::Specification.new do |s|
  s.name = "repofs-api-client"
  s.version = "1.1.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["\u{141}ukasz \u{15a}liwa"]
  s.date = "2015-06-26"
  s.email = "lukasz.sliwa@apptamers.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "lib/api-client.rb",
    "lib/api-client/base.rb",
    "lib/api-client/configuration.rb",
    "lib/api-client/developer.rb",
    "lib/api-client/developer/repository.rb",
    "lib/api-client/key.rb",
    "lib/api-client/repository.rb",
    "lib/api-client/request.rb",
    "lib/api-client/space.rb",
    "spec/lib/api-client/configuration_spec.rb",
    "spec/lib/api-client/developer_spec.rb",
    "spec/lib/api-client/key_spec.rb",
    "spec/lib/api-client/repository_spec.rb",
    "spec/lib/api-client/space_spec.rb",
    "spec/lib/api-client_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://git.apptamers.com/repohub/api-client"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "API Client"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<activemodel>, [">= 0"])
      s.add_runtime_dependency(%q<httparty>, ["~> 0.13.1"])
      s.add_runtime_dependency(%q<crack>, ["~> 0.4.2"])
      s.add_runtime_dependency(%q<oauth2>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
    else
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<activemodel>, [">= 0"])
      s.add_dependency(%q<httparty>, ["~> 0.13.1"])
      s.add_dependency(%q<crack>, ["~> 0.4.2"])
      s.add_dependency(%q<oauth2>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<activemodel>, [">= 0"])
    s.add_dependency(%q<httparty>, ["~> 0.13.1"])
    s.add_dependency(%q<crack>, ["~> 0.4.2"])
    s.add_dependency(%q<oauth2>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
  end
end

