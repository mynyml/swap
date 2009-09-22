spec = Gem::Specification.new do |s|
  s.name            = 'swap'
  s.version         = '0.1.1'
  s.summary         = "Organically replace/restore, stub/unstub methods"
  s.description     = "Organically replace/restore, stub/unstub methods."
  s.author          = "Martin Aumont"
  s.email           = 'mynyml@gmail.com'
  s.homepage        = ''
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
