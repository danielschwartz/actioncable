Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'actioncable'
  s.version     = '5.0.0.beta4'
  s.summary     = 'WebSocket framework for Rails.'
  s.description = 'Structure many real-time application concerns into channels over a single WebSocket connection.'

  s.required_ruby_version = '>= 2.2.2'

  s.license = 'MIT'

  s.author   = ['Pratik Naik', 'David Heinemeier Hansson']
  s.email    = ['pratiknaik@gmail.com', 'david@loudthinking.com']
  s.homepage = 'http://rubyonrails.org'

  s.files        = Dir['CHANGELOG.md', 'MIT-LICENSE', 'README.md', 'lib/**/*']
  s.require_path = 'lib'

  s.add_dependency 'actionpack', '~>4.2'

  s.add_dependency 'nio4r',            '~> 1.2'
  s.add_dependency 'websocket-driver', '~> 0.6.1'
end
