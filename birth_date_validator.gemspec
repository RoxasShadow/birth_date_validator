Kernel.load 'lib/birth_date_validator/version.rb'

Gem::Specification.new { |s|
  s.name          = 'birth_date_validator'
  s.version       = BirthDateValidator::VERSION
  s.author        = 'Giovanni Capuano'
  s.email         = 'webmaster@giovannicapuano.net'
  s.homepage      = 'https://github.com/RoxasShadow'
  s.summary       = 'Birth date validator for ActiveModel.'
  s.description   = 'Minimal birth date validator to check if the user has the right age to sign in the website.'
  s.licenses      = 'WTFPL'

  s.require_paths = ['lib']
  s.files         = Dir.glob('lib/**/*.rb')
  s.test_files    = Dir.glob('spec/**/*.rb')

  s.add_runtime_dependency 'activemodel', '~> 4.0'
  s.add_runtime_dependency 'activesupport', '~> 4.0'

  s.add_development_dependency 'rake', '~> 0'
  s.add_development_dependency 'rspec', '~> 0'
}
