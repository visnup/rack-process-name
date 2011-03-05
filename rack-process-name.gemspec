Gem::Specification.new do |s|
  s.name = "rack-process-name"
  s.version = "0.0.1"
  s.date = "2011-03-04"
  s.homepage = "https://github.com/visnup/rack-process-name"
  s.authors = ["Visnu Pitiyanuvath"]
  s.email = "visnupx@gmail.com"
  s.description = s.summary = "Rack::ProcessName is rack middleware to set the ruby process name to whatever request is currently being processed."

  s.files = %w[
    README.md
    LICENSE
    lib/rack-process-name.rb
  ]

  s.add_dependency "rack", ">= 0.9.0"
  s.extra_rdoc_files = %w[README.md]
  s.require_paths = %w[lib]
end
