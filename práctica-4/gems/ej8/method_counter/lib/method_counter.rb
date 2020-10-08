require "method_counter/version"

module MethodCounter
  class Error < StandardError; end
  # Your code goes here...
  module Countable
    def invocations
        @invocations ||= Hash.new(0)
    end
  
    module ClassMethods
      def count_invocations_of(sym)
        alias_method(":original_#{sym}", sym) 
        define_method "#{sym}" do
          invocations[__method__] += 1
          send(":original_#{sym}")
        end
      end
    end
  
    def invoked?(sym)
      if @invocations
        @invocations[sym] > 0
      else
        false
      end
    end
  
    def invoked(sym)
      if @invocations
        @invocations[sym]
      else
        0
      end
    end
  
    def self.included(base)
      base.extend ClassMethods
    end
  end
end
