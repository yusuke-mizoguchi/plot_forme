# -*- encoding: utf-8 -*-
# stub: coffeelint 1.16.1 ruby lib

Gem::Specification.new do |s|
  s.name = "coffeelint".freeze
  s.version = "1.16.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Zachary Bush".freeze]
  s.date = "2017-10-19"
  s.description = "Ruby bindings for coffeelint".freeze
  s.email = ["zach@zmbush.com".freeze]
  s.executables = ["coffeelint.rb".freeze]
  s.files = ["bin/coffeelint.rb".freeze]
  s.homepage = "https://github.com/zipcodeman/coffeelint-ruby".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.9".freeze
  s.summary = "Ruby bindings for coffeelint along with railtie to add rake task to rails".freeze

  s.installed_by_version = "3.3.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<coffee-script>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<execjs>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.4.0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 11.3.0"])
  else
    s.add_dependency(%q<coffee-script>.freeze, [">= 0"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
    s.add_dependency(%q<execjs>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.4.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 11.3.0"])
  end
end
