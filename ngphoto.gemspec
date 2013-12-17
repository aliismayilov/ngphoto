Gem::Specification.new do |s|
  s.name        = 'ngphoto'
  s.version     = '0.0.1'
  s.date        = '2013-12-17'
  s.summary     = "National Geographic Photo of the Day downloader"
  s.description = "Utility to download Photo of the Day from National Geographic"
  s.authors     = ["Ali Ismayilov"]
  s.email       = 'ali@ismailov.info'
  s.files       = ["lib/ngphoto.rb"]
  s.homepage    =
    'https://github.com/aliismayilov/ngphoto'
  s.license       = 'MIT'

  s.executables << 'ngphoto'

  s.add_dependency 'nokogiri', '~> 1.6.1'

  s.add_development_dependency 'bundler', '~> 1.3'
  s.add_development_dependency 'rspec',   '~> 2.14.1'
  s.add_development_dependency 'vcr',     '~> 2.8.0'
  s.add_development_dependency 'webmock', '>= 1.15.0'
end