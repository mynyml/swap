# Run me with:
#
#   ruby -rubygems examples/simple.rb
#

require 'pathname'
require 'ruby2ruby'
root  =  Pathname(__FILE__).dirname.parent
require root.join('lib/swap')

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

puts Ruby2Ruby.translate(User, :name)
#=> def name
#=>   @name
#=> end

User.swap!(:name) { @name.reverse }
puts user.name
#=> 'nitram'

puts Ruby2Ruby.translate(User, :name)
#=> def name
#=>   @name.reverse
#=> end

User.unswap!(:name)
puts user.name
#=> 'martin'

puts Ruby2Ruby.translate(User, :name)
#=> def name
#=>   @name
#=> end

