spec = Gem::Specification.new do |s|
  s.name            = 'swap'
  s.version         = '0.2'
  s.summary         = "Organically replace/restore, stub/unstub methods"
  s.description     = "Organically replace/restore, stub/unstub methods."
  s.author          = "Martin Aumont"
  s.email           = 'mynyml@gmail.com'
  s.homepage        = 'http://mynyml.com'
  s.has_rdoc        = true
  s.require_path    = "lib"
  s.files           = %w[
    LICENSE
    README
    TODO
    Rakefile
    lib/swap.rb
    test/test_helper.rb
    test/test_swap.rb
    examples/simple.rb
    specs.watchr
    swap.gemspec
  ]
  s.test_files      = %w[
    test/test_swap.rb
  ]
end
