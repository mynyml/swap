# Run me with:
#
#   ruby -rubygems examples/simple.rb
#

require 'swap'

# and let's spy on the source
require 'parse_tree_extensions'
require 'ruby2ruby'

class User
  extend Swappable
  attr_writer :name
  def name
    @name
  end
end

user = User.new
user.name = 'martin'
puts user.name
#=> 'martin'

puts user.method(:name).to_ruby
#=> def name
#=>   @name
#=> end

User.swap!(:name) { @name.reverse }
puts user.name
#=> 'nitram'

puts user.method(:name).to_ruby
#=> def name
#=>   @name.reverse
#=> end

User.unswap!(:name)
puts user.name
#=> 'martin'

puts user.method(:name).to_ruby
#=> def name
#=>   @name
#=> end

