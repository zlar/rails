require 'test/unit/testcase'
require 'active_support/testing/default'
require 'active_support/testing/core_ext/test'


module ActiveSupport
  class TestCase < Test::Unit::TestCase
    # test "verify something" do
    #   ...
    # end
    def self.test(name, &block)
      test_name = "test_#{name.gsub(/\s+/,'_')}".to_sym
      defined = instance_method(test_name) rescue false
      raise "#{test_name} is already defined in #{self}" if defined
      define_method(test_name, &block)
    end
  end
end
