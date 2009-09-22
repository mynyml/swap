require 'pathname'
require 'test/unit'

require 'context'
require 'matchy'
begin
  require 'redgreen'
  require 'ruby-debug'
  require 'quietbacktrace'
rescue LoadError, RuntimeError
  # pass
end

$:.unshift Pathname(__FILE__).dirname.parent + 'lib'

require 'swap'
