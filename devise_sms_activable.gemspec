# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'devise_sms_activable/version'

Gem::Specification.new do |s|
  s.name         = "devise_sms_activable"
  s.version      = DeviseSmsActivable::VERSION.dup
  s.platform     = Gem::Platform::RUBY
  s.authors      = ["Stefano Valicchia"]
  s.email        = ["stefano.valicchia@gmail.com"]
  s.homepage     = "https://github.com/giano/devise_sms_activable"
  s.summary      = "An SMS based activation strategy for Devise"
  s.description  = "It adds support for sending activation tokens via SMS and accepting them."
  s.files        = Dir["{app,config,lib}/**/*"] + %w[LICENSE README.rdoc]
  s.require_path = "lib"
  s.rdoc_options = ["--main", "README.rdoc", "--charset=UTF-8"]
  
  s.required_ruby_version     = '>= 1.8.6'
  s.required_rubygems_version = '>= 1.3.6'
  
  {
    'bundler'     => '~> 1.0.7',
    'rspec-rails' => '~> 2.5.0'
  }.each do |lib, version|
    s.add_development_dependency(lib, version)
  end
  
  {
    'rails'  => '~> 3.0.0',
    'devise' => '~> 1.1.0'
  }.each do |lib, version|
    s.add_runtime_dependency(lib, version)
  end
  
end
