Kernel.load 'lib/birth_date_validator/version.rb'

Gem::Specification.new { |s|
  s.name          = 'birth_date_validator'
  s.version       = BirthDateValidator::VERSION
  s.author        = 'Giovanni Capuano'
  s.email         = 'webmaster@giovannicapuano.net'
  s.homepage      = 'https://github.com/RoxasShadow'
  s.summary       = 'Birth date validator for ActiveModel.'
  s.description   = 'Set through various parameters the minimum or the range of ages in which your users have to be.'
  s.licenses      = 'WTFPL'

  s.require_paths = ['lib']
  s.files         = Dir.glob('lib/**/*.rb')
  s.test_files    = Dir.glob('spec/**/*.rb')

  s.add_runtime_dependency 'activemodel', '~> 4.1'
  s.add_runtime_dependency 'activesupport', '~> 4.1'

  s.add_development_dependency 'rake', '~> 0'
  s.add_development_dependency 'rspec', '~> 0'
}
