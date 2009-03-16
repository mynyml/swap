class Class

  # Swaps a method for another
  #
  # ==== Arguments
  # name<Symbol>::
  #   Name of original method to swap
  # code<String|Proc|UnboundMethod>::
  #   New code for method
  #
  # ==== Block
  # Alternative way to pass method code
  #
  # ==== Returns
  # self
  #
  # ==== Examples
  # User.swap!(:name, "@name.reverse")
  # User.swap!(:name, lambda { @name.reverse })
  # User.swap!(:name) { @name.reverse }
  # User.swap!(:name, User.instance_method(:first_name))
  #
  def swap!(name, code=nil, &block)
    name = name.to_sym
    meth = self.instance_method(name.to_sym)
    @swapped_methods ||= {}
    @swapped_methods[name] = meth
    if block_given?
      self.class_eval { define_method(name, &block) }
    else
      case code
      when String
        self.class_eval(%|def #{name}() #{code}; end|)
      when Proc, UnboundMethod
        self.class_eval { define_method(name, code) }
      end
    end
    self
  end

  # Restores a swapped method
  #
  # ==== Arguments
  # name<String>::
  #   Name of method to restore. If nil, all swapped methods for this class
  #   will be restored.
  #
  # ==== Returns
  # self
  #
  # ==== Examples
  # class User
  #   attr_accessor :name
  # end
  # user = User.new
  # user.name = 'martin'
  # puts user.name #=> 'martin'
  #
  # User.swap!(:name) { @name.reverse }
  # puts user.name #=> 'nitram'
  #
  # User.unswap!(:name)
  # puts user.name #=> 'martin'
  #
  def unswap!(name=nil)
    if name
      name = name.to_sym
      self.class_eval { define_method(name, @swapped_methods[name]) }
    else
      @swapped_methods.each do |name, code|
        self.class_eval { define_method(name, code) }
      end
    end
    self
  end
end
