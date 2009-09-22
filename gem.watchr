# Run me with:
#
#   $ watchr gem.watchr

# --------------------------------------------------
# Convenience Methods
# --------------------------------------------------
def build
  system "gem build swap.gemspec"
  FileUtils.mv Dir['swap-*.gem'], 'pkg/'
  puts
end

# --------------------------------------------------
# Watchr Rules
# --------------------------------------------------
watch( '\.gemspec$' ) { build }

# --------------------------------------------------
# Signal Handling
# --------------------------------------------------
# Ctrl-\
Signal.trap('QUIT') do
  puts " --- Building Gem ---\n\n"
  build
end

# Ctrl-C
Signal.trap('INT') { abort("\n") }


# vim:ft=ruby
