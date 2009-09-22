require 'test/test_helper'

class SwapTest < Test::Unit::TestCase
  context "Swap" do
    before do
      class ::Kitty
        extend Swappable
        def say() 'ohaie' end
      end
    end
    after do
      Object.class_eval { remove_const(:Kitty) }
      defined?(::Kitty).should be(nil)
    end
    context "replacing instance method" do
      test "accepts string" do
        Kitty.swap!(:say, %( 'kthxbai'.reverse ))
        Kitty.new.say.should be('kthxbai'.reverse)
      end
      test "accepts block" do
        Kitty.swap!(:say) { 'kthxbai' }
        Kitty.new.say.should be('kthxbai')
      end
      test "accepts proc" do
        Kitty.swap!(:say, lambda { 'kthxbai' })
        Kitty.new.say.should be('kthxbai')
      end
      test "accepts unbound method" do
        class ::Kitty
          def bai() 'kthxbai' end
        end
        Kitty.swap!(:say, Kitty.instance_method(:bai))
        Kitty.new.say.should be('kthxbai')
      end
    end
    context "reseting original methods" do
      test "restores single method" do
        Kitty.swap!(:say) { 'kthxbai' }
        Kitty.new.say.should be('kthxbai')
        Kitty.unswap!(:say)
        Kitty.new.say.should be('ohaie')
      end
      test "restores all methods" do
        class ::Kitty
          def bai() 'kthxbai' end
        end
        Kitty.swap!(:say) { 'o.0'  }
        Kitty.swap!(:bai) { 'zZzz' }
        Kitty.new.say.should be('o.0' )
        Kitty.new.bai.should be('zZzz')
        Kitty.unswap!
        Kitty.new.say.should be('ohaie')
        Kitty.new.bai.should be('kthxbai')
      end
    end
  end
end
