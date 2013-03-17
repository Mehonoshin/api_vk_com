# -*- encoding: utf-8 -*-
require File.expand_path('../lib/api_vk_com/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Andrey Baiburin']
  gem.email         = ['fbandrey@gmail.com']
  gem.summary       = %q{Gem for vk.com API}
  gem.homepage      = 'http://github.com/fbandrey/api_vk_com'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'api_vk_com'
  gem.require_paths = ['lib']
  gem.version       = ApiVkCom::VERSION
end