# Run me with:
#
#   $ watchr specs.watchr

# --------------------------------------------------
# Watchr Rules
# --------------------------------------------------
watch( '^test/test_swap\.rb'   )  { system "ruby -rubygems test/test_swap.rb"  }
watch( '^lib/swap\.rb'         )  { system "ruby -rubygems test/test_swap.rb"  }
watch( '^test/test_helper\.rb' )  { system "ruby -rubygems test/test_swap.rb"  }
watch( '^examples/simple\.rb'  )  { system "ruby -rubygems examples/simple.rb"; puts '-'*30  }

# --------------------------------------------------
# Signal Handling
# --------------------------------------------------
# Ctrl-\
Signal.trap('QUIT') do
  puts " --- Running all tests ---\n\n"
  system "ruby -rubygems test/test_swap.rb" 
end

# Ctrl-C
Signal.trap('INT') { abort("\n") }

